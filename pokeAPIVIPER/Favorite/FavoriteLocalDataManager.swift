//
//  FavoriteLocalDataManager.swift
//  pokeAPIVIPER
//
//  Created by Mayra Brenda Carreño Mondragon on 16/06/22.
//  
//

import Foundation
import CoreData
import UIKit

class FavoriteLocalDataManager:FavoriteLocalDataManagerInputProtocol {
    func eliminarData() {
        
    }
    var interactor: FavoriteLocalDataManagerOutputProtocol?
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
       
    var favorit: [favorite]? = []

    var attack: Int?
    var defense: Int?
    var desc: String?
    var name: String?
    var imageUrl: String?
   
       
        func getDataLocal(){
            
            let context = appDelegate.persistentContainer.viewContext

            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorite")
            request.returnsObjectsAsFaults = false
            do {
                let result = try context.fetch(request)
                for data in result as! [NSManagedObject]
                {
    
                    self.attack = data.value(forKey: "attack")! as? Int
                    self.defense = data.value(forKey: "defense")! as? Int
                    self.desc = data.value(forKey: "desc")! as? String
                    self.name = data.value(forKey: "name")! as? String
                    self.imageUrl = data.value(forKey: "image")! as? String
                   
                    let fav = favorite(attack: attack!, defense: defense!, desc: desc!, name: name!, imageUrl: imageUrl!)
                    
                    self.favorit?.append(fav)
                    
                }
               
               interactor?.callBack(fav: favorit!)
                
            } catch {
                
                print("Failed")
            }
        }
    
    
    func eliminarData(data : [NSManagedObject]) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        for dato in data {
            context.delete(dato)
            do {
            try context.save()

            }
            catch {

            }
        }
        
    }
    }
    
    

    
   
    
    


