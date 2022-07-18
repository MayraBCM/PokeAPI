//
//  FavoriteDetailView.swift
//  pokeAPIVIPER
//
//  Created by Mayra Brenda Carreño Mondragon on 28/06/22.
//  
//

import Foundation
import UIKit
import CoreData

class FavoriteDetailView: UIViewController {
    @IBOutlet weak var lblNombrefav: UILabel!
    
    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var imvImagefav: UIImageView!
    
    @IBOutlet weak var lblAttack: UILabel!
    
    @IBOutlet weak var tvxDescription: UITextView!
    @IBOutlet weak var lblDesc: UILabel!
   
    
    
    // MARK: Properties
    var presenter: FavoriteDetailPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    
    
    @IBAction func btnDeletFav(_ sender: Any) {
        let alert = UIAlertController(title: "Eliminar ", message: "Esta seguro de que desea eliminar de favoritos", preferredStyle: .alert)
          
          let action = UIAlertAction(title: "Si", style: .default) { [self] UIAlertAction in
              presenter?.deleteFavoritos(id: presenter?.interactor?.entity?.favS.id ?? 0)
              
            self.dismiss(animated: true)
          }
          let cancel = UIAlertAction(title: "Cancelar", style: .cancel)
          alert.addAction(action)
          alert.addAction(cancel)
          present(alert, animated: true)
    }
}

extension FavoriteDetailView: FavoriteDetailViewProtocol {
   
    func getDataFav(fav: favorite) {
        lblNombrefav.text = fav.name
        lblAttack.text = String(fav.attack)
        lblDesc.text = String(fav.defense)
        tvxDescription.text = fav.desc
        presenter?.interactor?.entity?.favS = fav
               
               guard let url = URL(string: fav.imageUrl )  else {return}
               do{
                   let data = try Data(contentsOf: url)
                   DispatchQueue.main.async {
                       self.imvImagefav.image = UIImage(data: data)
                   }
               }catch{
                   print("Error Image Detail from url")
                   
           }
        
    }
    
   
}

