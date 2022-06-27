//
//  favorite.swift
//  pokeAPIVIPER
//
//  Created by Mayra Brenda Carreño Mondragon on 22/06/22.
//

import UIKit

class favorite : NSObject {
   
   
    var attack: Int
    var defense: Int
    var desc: String
    var name: String
    var imageUrl: String
  
    
    init ( attack: Int, defense: Int, desc: String, name: String, imageUrl : String){
        
      
        self.attack = attack
        self.defense = defense
        self.desc = desc
        self.name = name
        self.imageUrl = imageUrl
          
    }

}
