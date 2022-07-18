//
//  DetailView.swift
//  pokeAPIVIPER
//
//  Created by Mayra Brenda Carreño Mondragon on 10/06/22.
//  
//

import Foundation
import UIKit

class DetailView: UIViewController {
    
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var imvImage: UIImageView!
    @IBOutlet weak var lblAttack: UILabel!
    @IBOutlet weak var lblDefence: UILabel!
    @IBOutlet weak var btnFavorite: UIButton!
    
    @IBOutlet weak var aivActivity: UIActivityIndicatorView!
    
    @IBOutlet weak var txvDescription: UITextView!
    
    var presenter: DetailPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
      
    }
    

    @IBAction func addFavorite(_ sender: UIButton) {
          presenter?.saveData()
        
    }
  
    
    @IBAction func goFavorite(_ sender: Any) {
        presenter?.goFavorite()
    }
}

extension DetailView: DetailViewProtocol {
          func cargarActivity() {
        DispatchQueue.main.async {
            self.aivActivity.startAnimating()
        }
    
    }
    
    func stopAndHideActivity() {
        DispatchQueue.main.async {
            self.aivActivity.stopAnimating()
            self.aivActivity.hidesWhenStopped = true
        }
        
    }
    
    func getDataPoke(poke: Pokemon_Struct) {
        lblNombre.text = poke.name
        lblAttack.text = String(poke.attack)
        lblDefence.text = String(poke.defense)
        txvDescription.text = poke.description
        
        presenter?.interactor?.entity?.pokeS = poke
        
        guard let url = URL(string: poke.imageUrl )  else {return}
        do{
            let data = try Data(contentsOf: url)
            DispatchQueue.main.async {
                self.imvImage.image = UIImage(data: data)
                self.stopAndHideActivity()
            }
        }catch{
            print("Error Image Detail from url")
            
    }
        
    }
  
    func setImageBtn(image: UIImage?){
        if let image = image {
            btnFavorite.setImage(image, for: .normal)
        }
    }
  
    
   
    
   
}
