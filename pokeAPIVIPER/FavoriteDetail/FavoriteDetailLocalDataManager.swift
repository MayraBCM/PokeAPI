//
//  FavoriteDetailLocalDataManager.swift
//  pokeAPIVIPER
//
//  Created by Mayra Brenda Carreño Mondragon on 28/06/22.
//  
//

import Foundation
import CoreData
import UIKit

class FavoriteDetailLocalDataManager:FavoriteDetailLocalDataManagerInputProtocol {
    
    var fav : [NSManagedObject]?
    
    func deleteData(id: Int) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
              let context = appDelegate.persistentContainer.viewContext
        let request = Favorite.fetchRequest() as NSFetchRequest<Favorite>
        
        let pred = NSPredicate(format:"id = %@","\(id)")
        request.predicate = pred
        
             
              do {
                  self.fav = try context.fetch(request)
                  context.delete(fav![0])
                  try context.save()
                  
                  
              }catch{
                  
              }
    }
    
}
    

  
    

