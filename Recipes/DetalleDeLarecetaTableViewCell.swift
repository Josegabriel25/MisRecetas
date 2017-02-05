//
//  DetalleDeLarecetaTableViewCell.swift
//  Recipes
//
//  Created by José Montero on 4/1/17.
//  Copyright © 2017 José Montero. All rights reserved.
//

import UIKit
import Foundation

class DetalleDeLarecetaTableViewCell: UITableViewCell {
    
    @IBOutlet var valorClave: UILabel!
    
    @IBOutlet var valorReceta: UILabel!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

