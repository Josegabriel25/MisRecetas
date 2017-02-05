//
//  ViewController.swift
//  Recipes
//
//  Created by José Montero on 27/12/16.
//  Created by José Montero on 05/02/17.
//  Copyright © 2016 José Montero. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var recipes:[Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Mis Recetas", style: .plain, target: nil, action: nil)
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        
        
        //self.tableView.separatorStyle = .none -> Dejar sin lineas entre celdas
        
        
        //let imgenView = UIImageView(frame: CGRect(x: 0, y: 0, width: 3, height: 3))
        //let iconoFood = UIImageView(image: UIImage(named: "FooLogo"))
        /*let myImage = UIImage(named: "FooLogo")
        imgenView.image = myImage*/
        //self.navigationItem.titleView = iconoFood
        
        // Do any additional setup after loading the view, typically from a nib.
        
        var recipe = Recipe(nombre: "Apple Pie",
                            image: #imageLiteral(resourceName: "ApplePie"),
                            tiempo: 30,
                            ingredientes: ["5 Manzanas",
                                           "Pasta de hojaldre",
                                           "Canela"],
                            pasos: ["Cortar las manzanas",
                                    "Amazar el hojaldre",
                                    "Hacer en almíbar la manzana con la canela",
                                    "En un bowl colocar el almíbar y sobre este el hojaldre",
                                    "Hornear por 15 minutos a 180ºC"])
        recipes.append(recipe)
        recipe = Recipe(nombre: "Patatas Asadas",
                        image: #imageLiteral(resourceName: "PatatasAsadas"),
                        tiempo: 20,
                        ingredientes: ["Una libra de patatas",
                                       "Pimienta",
                                       "Aceite",
                                       "Sal"],
                        pasos: ["Pelar y lavar las patatas",
                                "Condimentar las patatas",
                                "Precalentar la sartén a fuego medio con una cucharadita de aceite",
                                "Colocar las patatas en la sartén por 15 min y retirrlas enseguida"])
        recipes.append(recipe)
        recipe = Recipe(nombre: "Pizza",
                        image: #imageLiteral(resourceName: "Pizza"),
                        tiempo: 60,
                        ingredientes: ["Harina",
                                       "Levadura",
                                       "Salsa de tomate",
                                       "Queso",
                                       "Vegetales",
                                       "Dos tipos de embutidos",
                                       "Aceite"],
                        pasos: ["Elaborar la masa de pizza",
                                "Huntar la salsa de tomate sobre la masa",
                                "Cortar y pelar los embutidos y vegetables",
                                "Rallar el queso y colocar sobre la salsa de tomate",
                                "Adornar al gusto la pizza con los vegetales y embutidos",
                                "Precalentar el horno a 180ºC y hornear la pizza por 20 minutos"])
        recipes.append(recipe)
        recipe = Recipe(nombre: "Paella", image: #imageLiteral(resourceName: "Paella"),
                        tiempo: 120,
                        ingredientes: ["Arroz",
                                       "Camarón",
                                       "Curry",
                                       "Arvejas",
                                       "Zanahorias",
                                       "Guineo"],
                        pasos: ["Realizar el arroz con curry, arvejas y zanahorias",
                                "Limpiar y cocinar los camarones",
                                "Mezclar los camarones con el arroz",
                                "Freír o asar los guineos y aadonarlos en el arroz al gusto"])
        recipes.append(recipe)
        
        
    }
    
    /*override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
    }*/

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    /*override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }*/

    /*override var prefersStatusBarHidden: Bool {
        return true
    }*/

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let receta = recipes[indexPath.row]
        let identificadorCeldaReceta = "RecetaUno"
        let cell = tableView.dequeueReusableCell(withIdentifier: identificadorCeldaReceta, for: indexPath) as! RecipeCell
        
        cell.vistaDeImagen.image = receta.imagen
        cell.tituloUno.text = receta.nombre
        cell.tituloDos.text = "\(receta.tiempo) min"
        cell.tituloTres.text = "Ingredientes: \(receta.ingredientes.count)"
        
        //Imagenes Redondas
        
        cell.vistaDeImagen.layer.cornerRadius = 45.0
        cell.vistaDeImagen.clipsToBounds = true
        
        //Crear marca como fav o no fav
        
        if receta.isFavourite {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        //cell.imagenBackground.image = receta.imagen
        /*cell.tituloGrande.text = receta.nombre
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: cell.frame.width, height: 200))
        let myImage = receta.imagen
        imageView.image = myImage
        cell.backgroundView = UIView()
        cell.backgroundView!.addSubview(imageView)*/
        
        
        return cell
    }
    
    //MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.recipes.remove(at: indexPath.row)
        }
        
        //self.tableView.reloadData()
        self.tableView.deleteRows(at: [indexPath], with: .left)
    }
    
   override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let shareAction = UITableViewRowAction(style: .default, title: "Compartir") { (action, indexPath) in
        let shareText = "Estoy por preparar \(self.recipes[indexPath.row].nombre)"
            let activityController = UIActivityViewController(activityItems: [shareText, self.recipes[indexPath.row].imagen], applicationActivities: nil)
            self.present(activityController, animated: true, completion: nil)
            
    }
    
    shareAction.backgroundColor = UIColor(colorLiteralRed: 30.0/255.0, green: 164.0/255.0, blue: 253.0/255.0, alpha: 1.0)
    
    let deleteAction = UITableViewRowAction(style: .default, title: "Borrar") { (action, indexPath) in
        self.recipes.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    deleteAction.backgroundColor = UIColor(colorLiteralRed: 202.0/255.0, green: 202.0/255.0, blue: 202.0/255.0, alpha: 1.0)
    
    return [shareAction, deleteAction]
    
    }
    
    //Seleccion de celda
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        /*let recipe = self.recipes[indexPath.row]
        
        
        let alerta = UIAlertController(title: recipe.nombre, message: "Valora este plato", preferredStyle: .alert)
        let cancelaction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alerta.addAction(cancelaction)
        
        var favorutiteActionTitle = "Favorite"
        var favouriteActionStyle = UIAlertActionStyle.default
        if recipe.isFavourite {
            favorutiteActionTitle = "No favorita"
            favouriteActionStyle = UIAlertActionStyle.destructive
        }
        
        let botonFavorito = UIAlertAction(title: favorutiteActionTitle, style: favouriteActionStyle) { (action) in
            let recipe = self.recipes[indexPath.row]
            recipe.isFavourite = !recipe.isFavourite
            self.tableView.reloadData()
        }
        alerta.addAction(botonFavorito)
        self.present(alerta, animated: true, completion: nil)*/
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "recipeDetails" {
            if let IndexPath = self.tableView.indexPathForSelectedRow {
                let selectedRecipe = self.recipes[IndexPath.row]
                let destinoVista = segue.destination as! DetailViewController
                destinoVista.recetaVistaDos = selectedRecipe
            }
        }
        
        
    }
    
}

