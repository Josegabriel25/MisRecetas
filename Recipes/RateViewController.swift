//
//  RateViewController.swift
//  Recipes
//
//  Created by José Montero on 13/1/17.
//  Copyright © 2017 José Montero. All rights reserved.
//

import UIKit





class RateViewController: UIViewController {
    
    let misRecetas = [Recipe]()
    
    var ratingSelected:String?
    
    @IBOutlet var nombreDelPlato: UILabel!
    @IBOutlet var fondoBackgroundRate: UIImageView!
    
    @IBOutlet var botonStack1: UIButton!
    @IBOutlet var botonStack2: UIButton!
    @IBOutlet var botonStack3: UIButton!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    self.fondoBackgroundRate.image = UIImage(named: "avellanaFondo")
    self.nombreDelPlato.text = "¿Te ha gustado este plato?"
        // Do any additional setup after loading the view.
        
        let blurEffect = UIBlurEffect(style: .dark)
        let vistaEfectoBlur = UIVisualEffectView(effect: blurEffect)
        vistaEfectoBlur.frame = view.bounds
        fondoBackgroundRate.addSubview(vistaEfectoBlur)
        
        /*var misBotones = [UIButton]()
        misBotones = [botonStack1, botonStack2, botonStack3]*/
        
        /*let scale01 = botonStack1.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        let scale02 = botonStack2.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        let sclae03 = botonStack3.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)*/
        
        let transition = CGAffineTransform(translationX: 0.0, y: 5.0)
        let scale = CGAffineTransform(scaleX: 0.0, y: 0.0)
        
        botonStack1.transform = scale.concatenating(transition)
        botonStack2.transform = scale.concatenating(transition)
        botonStack3.transform = scale.concatenating(transition)
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        /*UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
            self.botonStack1.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self.botonStack2.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self.botonStack3.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)*/
    
    
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
            self.botonStack1.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: { (success) in
            UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
                self.botonStack2.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }, completion: { (success) in
                UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
                    self.botonStack3.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                }, completion: { (success) in
                    
                })
            })
        })
    
    
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        
    @IBAction func ratingPressed(_ sender: UIButton) {
    
        switch sender.tag {
        case 1:
            ratingSelected = "dislike"
        case 2:
            ratingSelected = "good"
        case 3:
            ratingSelected = "great"
        default:
            break
        }
    
        performSegue(withIdentifier: "oooSiSiSi", sender: sender)
    
    }
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
