//
//  RecipeCell.swift
//  Recipes
//
//  Created by José Montero on 29/12/16.
//  Copyright © 2016 José Montero. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {

    @IBOutlet var vistaDeImagen: UIImageView!
    @IBOutlet var tituloUno: UILabel!
    @IBOutlet var tituloDos: UILabel!
    @IBOutlet var tituloTres: UILabel!
    
    @IBOutlet var tituloGrande: UILabel!
    @IBOutlet var imagenBackground: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
