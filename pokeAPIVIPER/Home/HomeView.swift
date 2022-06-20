//
//  HomeView.swift
//  pokeAPIVIPER
//
//  Created by Mayra Brenda Carreño Mondragon on 10/06/22.
//  
//

import Foundation
import UIKit

class HomeView: UIViewController {

   
 var presenter: HomePresenterProtocol?
   
 var arrListaPoke = [Pokemon_Struct]()
    

    @IBOutlet weak var tblTabla: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
    }
}

extension HomeView: HomeViewProtocol {
    func presenterPushDataView(with data: [Pokemon_Struct]) {
        arrListaPoke = data
        DispatchQueue.main.async {
            self.tblTabla.reloadData()
        }
       
        
        
    }
    
}

extension HomeView : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
//        presenter?.showDataDetail()
       
        presenter?.showDetailView(attack: self.arrListaPoke[indexPath.row].attack, defense: self.arrListaPoke[indexPath.row].defense, description: self.arrListaPoke[indexPath.row].description, imageUrl: self.arrListaPoke[indexPath.row].imageUrl)
        tableView.deselectRow(at: indexPath, animated: true)
    
        
    }
}


extension HomeView : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrListaPoke.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = arrListaPoke[indexPath.row].name
        return cell
    }
    
    
    
}
