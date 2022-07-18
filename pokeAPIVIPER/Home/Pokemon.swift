//
//  Pokemon.swift
//  pokeAPIVIPER
//
//  Created by Mayra Brenda Carreño Mondragon on 10/06/22.
//

import Foundation

class pokemonEntity {
    var arrLista : [Pokemon_Struct]!
  

}

struct Pokemon_Struct : Codable {
        let id: Int
        let attack: Int
        let defense: Int
        let description: String
        let name: String
        let imageUrl: String
        let type: String
}
