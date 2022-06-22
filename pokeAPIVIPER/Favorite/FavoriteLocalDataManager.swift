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
    

    var interactor: FavoriteLocalDataManagerOutputProtocol?
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
       
    var favorit: [favorite]? = []
  
    var name: String?
    var imageUrl: String?
    var type: String?
       
        func getDataLocal(){
            
            let context = appDelegate.persistentContainer.viewContext

            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorite")
            request.returnsObjectsAsFaults = false
            do {
                let result = try context.fetch(request)
                for data in result as! [NSManagedObject]
                {
                   
                   
                    self.name = data.value(forKey: "name")! as? String
                 
                    self.imageUrl = data.value(forKey: "image")! as? String
                   
                    let fav = favorite( name: name!, imageUrl: imageUrl!)
                    
                    self.favorit?.append(fav)
                    
                }
                print(favorit)
               interactor?.callBack(fav: favorit!)
                
            } catch {
                
                print("Failed")
            }
        }
}
    
   
    
    


