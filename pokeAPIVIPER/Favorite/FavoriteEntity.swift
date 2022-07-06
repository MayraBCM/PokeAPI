//
//  FavoriteEntity.swift
//  pokeAPIVIPER
//
//  Created by Mayra Brenda Carreño Mondragon on 28/06/22.
//

import Foundation

class FavoriteEntity: NSObject {
    
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
