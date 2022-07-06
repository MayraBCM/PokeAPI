//
//  HomeView.swift
//  pokeAPIVIPER
//
//  Created by Mayra Brenda Carreño Mondragon on 10/06/22.
//  
//

import Foundation
import UIKit

class viewCell : UITableViewCell{

    @IBOutlet weak var lblNombre : UILabel!
    
    @IBOutlet weak var imvImage: UIImageView!    
    }


class HomeView: UIViewController {

 var presenter: HomePresenterProtocol?
   
    @IBOutlet weak var tblTabla: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
    }
    
}

extension HomeView: HomeViewProtocol {
   
    
    func presenterPushDataView(with data: [Pokemon_Struct]) {
        presenter?.arrListaPoke = data
        DispatchQueue.main.async {
            self.tblTabla.reloadData()
        }
    }
}


extension HomeView : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.arrListaPoke?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! viewCell
        
        cell.lblNombre.text = presenter?.arrListaPoke[indexPath.row].name
    
         let url = URL(string: presenter?.arrListaPoke[indexPath.row].imageUrl ?? "")
        do{
            let data = try Data(contentsOf: url!)
            DispatchQueue.main.async {
                cell.imvImage?.image = UIImage(data: data)
                
            }
        }catch{
            print("Error Image Detail from url")
            
    }
        
        return cell
    }
}

extension HomeView : UITableViewDelegate{
    
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      presenter?.showDataDetail(poke: (presenter?.arrListaPoke[indexPath.row])!)
      tblTabla.deselectRow(at: indexPath, animated: true)
    }
}

