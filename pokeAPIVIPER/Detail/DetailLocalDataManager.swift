//
//  DetailLocalDataManager.swift
//  pokeAPIVIPER
//
//  Created by Mayra Brenda Carreño Mondragon on 10/06/22.
//  
//

import Foundation
import UIKit
import CoreData

class DetailLocalDataManager:DetailLocalDataManagerInputProtocol {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var id: Int?
    var attack: Int?
    var defense: Int?
    var description: String?
    var name: String?
    var imageUrl: String?
    var type: String?

        

    
    func saveData(pokemon: Pokemon_Struct) {
       
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Favorite", in: context)
        let newFavorite = NSManagedObject(entity: entity!, insertInto: context)
        newFavorite.setValue(pokemon.attack, forKey: "attack")
        newFavorite.setValue(pokemon.defense, forKey: "defense")
        newFavorite.setValue(pokemon.description, forKey: "desc")
        newFavorite.setValue(pokemon.name, forKey: "name")
        newFavorite.setValue(pokemon.imageUrl, forKey: "image")
        newFavorite.setValue(pokemon.type, forKey: "type")
                
               
                do {
                  try context.save()
                    print("Save")
                 } catch {
                  print("Error saving")
                }
        
            }
    
        
    }
    
    
    
    
    
    
    

