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

extension HomeView : UITableViewDelegate{
    
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
     
      presenter?.showDataDetail(poke: arrListaPoke[indexPath.row])
       
    
       
        
    }
}

