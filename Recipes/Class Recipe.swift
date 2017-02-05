//
//  Class Recipe.swift
//  Recipes
//
//  Created by José Montero on 27/12/16.
//  Copyright © 2016 José Montero. All rights reserved.
//

import Foundation
import UIKit

class Recipe: NSObject {
    var nombre:String = String()
    var imagen:UIImage = UIImage()
    var tiempo:Int = Int()
    var ingredientes:[String] = []
    var pasos:[String] = []
    
    var isFavourite:Bool = false
    var favorito:String = "raiting"
    
    init(nombre:String, image:UIImage, tiempo:Int, ingredientes:[String], pasos:[String]) {
        self.nombre = nombre
        self.imagen = image
        self.tiempo = tiempo
        self.ingredientes = ingredientes
        self.pasos = pasos
    }
    
    
    
}
