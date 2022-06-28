//
//  FavoriteView.swift
//  pokeAPIVIPER
//
//  Created by Mayra Brenda Carreño Mondragon on 16/06/22.
//  
//

import Foundation
import UIKit

class viewColletion : UICollectionViewCell{

    
    @IBOutlet weak var image: UIImageView!
   
    @IBOutlet weak var lblnombrep: UILabel!
    
}

class FavoriteView: UIViewController {
    
    @IBOutlet weak var collectionview: UICollectionView!
    
    var presenter: FavoritePresenterProtocol?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
    }
    
    @IBOutlet weak var btnRemove: UICollectionView!
    
}

extension FavoriteView: FavoriteViewProtocol {
    func showData(fav: [favorite]) {
        
        presenter?.arrFavoritos = fav
        DispatchQueue.main.async {
            self.collectionview.reloadData()
        }
    }
}


extension FavoriteView : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.arrFavoritos?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! viewColletion
        
        cell.lblnombrep.text = presenter?.arrFavoritos[indexPath.row].name
       
        
        let url = URL(string: presenter?.arrFavoritos[indexPath.row].imageUrl ?? "")!
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                    cell.image.image = loadedImage
                }
            }
        return cell
    }
}

extension FavoriteView : UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        presenter?.showDataDetail(fav: (presenter?.arrFavoritos[indexPath.row])!)
    }
    
    
}
