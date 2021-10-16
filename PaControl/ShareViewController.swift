//
//  ShareViewController.swift
//  PaControl
//
//  Created by Kevin Duenas on 13/10/21.
//

import UIKit

class ShareViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    

    @IBOutlet weak var tableView: UITableView!
    
    var dataSource : [Registry] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = UserDefaults.standard.data(forKey: "Data") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                let data = try decoder.decode([Registry].self, from: data)
                
                dataSource += data

            } catch {
                print("Unable to Decode Notes (\(error))")
            }
        }
        
    }
    
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 46
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "registryCell") as! RegistryCell
        
        if(index % 2 == 0){
            cell.backgroundColor = UIColor(red: 0.83, green: 0.90, blue: 0.93, alpha: 1.00)
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let dateAux = dataSource[indexPath.row].date
        let date = dateFormatter.string(from: dateAux)
        
      
        cell.lbdate.text = date
        cell.lbPA.text = String(dataSource[indexPath.row].pa)
        cell.lbCA.text = String(dataSource[indexPath.row].ca)
        cell.lbFC.text = String(dataSource[indexPath.row].fc)
        
        return cell
    }

}
