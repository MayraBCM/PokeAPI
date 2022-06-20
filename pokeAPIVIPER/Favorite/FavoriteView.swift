//
//  FavoriteView.swift
//  pokeAPIVIPER
//
//  Created by Mayra Brenda Carreño Mondragon on 16/06/22.
//  
//

import Foundation
import UIKit

class FavoriteView: UIViewController {

    // MARK: Properties
    var presenter: FavoritePresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension FavoriteView: FavoriteViewProtocol {
    // TODO: implement view output methods
}
