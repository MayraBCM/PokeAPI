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
    
    @IBOutlet var lblNombre: UIView!
    
    @IBOutlet weak var imvImage: UIImageView!
    
    @IBOutlet weak var lblAttack: UILabel!
    
    @IBOutlet weak var lblDefence: UILabel!
    
    @IBOutlet weak var txvDescription: UITextView!
    
  
    var presenter: DetailPresenterProtocol?

    var arrPoke = [Pokemon_Struct]()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension DetailView: DetailViewProtocol {
    func ShowData(attack: Int, defense: Int, description: String, imageUrl: String) {
        txvDescription.text = description
        lblAttack.text = String(attack)
    }
    
   
    
   
}
