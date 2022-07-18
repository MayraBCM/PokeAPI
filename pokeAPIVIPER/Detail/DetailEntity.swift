//
//  DetailEntity.swift
//  pokeAPIVIPER
//
//  Created by Mayra Brenda Carreño Mondragon on 11/07/22.
//

import Foundation
import UIKit

class DetailEntity {
    
    var btnFav: Bool = true
    var pokeS : Pokemon_Struct?
    var imageA = "anadir.png"
    var imageF = "Favorito1.png"
  
    
    var favImage: UIImage {
        if btnFav {
        return UIImage(named: imageA) ?? UIImage()
        }
        return UIImage(named: imageF) ?? UIImage()
    }

}
