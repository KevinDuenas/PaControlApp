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
        1
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
        
        let todayRegistry = Day()
        
        let checkMark = UIImage(named: "check-mark")
        let circulation = UIImage(named: "circulation")
        
        cell.lbdate.text = date
       
        cell.imgA1.image = todayRegistry.A1?.pa == nil ? checkMark : circulation
        cell.imgA2.image =  todayRegistry.A2?.pa != nil ?  checkMark :  circulation
        cell.imgA3.image =  todayRegistry.A3?.pa != nil ?  checkMark :  circulation
        
        cell.imgB1.image =  todayRegistry.B1?.pa != nil ?  checkMark :  circulation
        cell.imgB2.image =  todayRegistry.B2?.pa != nil ?  checkMark :  circulation
        cell.imgB3.image =  todayRegistry.B3?.pa != nil ?  checkMark :  circulation
        
        return cell
    }

}
