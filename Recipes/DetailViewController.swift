//
//  DetailViewController.swift
//  Recipes
//
//  Created by José Montero on 3/1/17.
//  Copyright © 2017 José Montero. All rights reserved.
//

import UIKit
import Foundation

class DetailViewController: UIViewController {
    
    
    @IBOutlet var separadorDeCeldas: UITableView!
    @IBOutlet var recetaImagen: UIImageView!
    @IBOutlet var nombreDeLaReceta: UILabel!
    @IBOutlet var tiempoReceta: UILabel!
    @IBOutlet var ratingButton: UIButton!
    
    
    
    var recetaVistaDos: Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.title = recetaVistaDos.nombre
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        
        self.recetaImagen.image = self.recetaVistaDos.imagen
        
        self.nombreDeLaReceta.text = self.recetaVistaDos.nombre

        self.tiempoReceta.text = "\(self.recetaVistaDos.tiempo) min"
        
        self.separadorDeCeldas.backgroundColor = UIColor(colorLiteralRed: 0.9, green: 0.9, blue: 0.9, alpha: 0.25)
        
        //self.separadorDeCeldas.tableFooterView = UIView(frame: CGRect.zero)
        
        self.separadorDeCeldas.estimatedRowHeight = 44.0
        
        self.separadorDeCeldas.rowHeight = UITableViewAutomaticDimension
        
        let imageRate = UIImage(named: self.recetaVistaDos.favorito)
        self.ratingButton.setImage(imageRate, for: UIControlState.normal)
        
    }
    
    /*override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }*/
    
    @IBAction func close(segue:UIStoryboardSegue){
        if let rateVC = segue.source as? RateViewController {
            if let rating = rateVC.ratingSelected {
                self.recetaVistaDos.favorito = rating
                let imageRate = UIImage(named: self.recetaVistaDos.favorito)
                self.ratingButton.setImage(imageRate, for: UIControlState.normal)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    

}

extension DetailViewController : UITableViewDataSource {
    
     /*func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }*/
    
     func numberOfSections(in tableView: UITableView) -> Int {
       return  3
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        case 1:
            return self.recetaVistaDos.ingredientes.count
        case 2:
            return self.recetaVistaDos.pasos.count
        default:
            return 0
        }
        
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "CeldaDetallada", for: indexPath) as! DetalleDeLarecetaTableViewCell
        
        cell.backgroundColor = UIColor.clear
        
        //cell.separatorInset.bottom = 1
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                cell.valorClave.text = "Necesitas"
                cell.valorReceta.text = " \(self.recetaVistaDos.ingredientes.count) ingredientes"
                /*case 1:
                 cell.valorClave.text = "Ingredientes"
                 //cell.valorReceta.text = "\(self.recetaVistaDos.ingredientes[indexPath.section])"
                 /*let indice = ""
                 var arrayFinal = "\(self.recetaVistaDos.ingredientes[indexPath.row])"
                 for indice in arrayFinal {
                 cell.valorReceta.text = "\(indice)"
                 print("\(indice)")
                 }*/
                 
                 cell.valorReceta.text = recetaVistaDos.ingredientes[indexPath.item]
                 
                 case 2:
                 /*cell.valorClave.text = "Favorita"
                 //cell.valorReceta.text = ""
                 if self.recetaVistaDos.isFavourite {
                 cell.valorReceta.text = "Si"
                 } else {
                 cell.valorReceta.text = "No"
                 }*/
                 
                 cell.valorClave.text = "Ingredientes"
                 cell.valorReceta.text = "\(self.recetaVistaDos.ingredientes.count)"*/
                
            default:
                break
            }
    case 1:
        
        if indexPath.row == 0 {
                cell.valorClave.text = "Ingredientes"
        } else {
                cell.valorClave.text = ""
            }
        cell.valorReceta.text = self.recetaVistaDos.ingredientes[indexPath.row]
        
            
    case 2:
        
        if indexPath.row == 0 {
            cell.valorClave.text = "Proceso"
        } else {
            cell.valorClave.text = ""
        }
        
        
         cell.valorReceta.text = self.recetaVistaDos.pasos[indexPath.row]
            
            
    /*case 3:
        
        let imageButtonName = UIImage
        
        cell.valorClave.text = "Review"
        cell.valorReceta.text = ""*/
            
        default:
            break
        }
        
        
        tableView.separatorStyle = .none
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       
        var title = ""
        
        switch section {
        case 1:
            title = "Ingredientes"
        case 2:
            title = "Pasos"
        case 3:
            title = "¿Favorito?"
        default:
            break
        }
     
        return title
    }
    
    
}

extension DetailViewController : UITableViewDelegate {

}

