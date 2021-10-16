//
//  NewRegistryViewController.swift
//  PaControl
//
//  Created by Kevin Duenas on 13/10/21.
//

import UIKit

class NewRegistryViewController: UIViewController {

    @IBOutlet weak var tfPA: UITextField!
    @IBOutlet weak var tfCA: UITextField!
    @IBOutlet weak var tfFC: UITextField!
    @IBOutlet weak var btRregistrar: UIButton!
    
    var registries = [Registry]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if let data = UserDefaults.standard.data(forKey: "Data") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                let data = try decoder.decode([Registry].self, from: data)
                
                registries += data

            } catch {
                print("Unable to Decode Notes (\(error))")
            }
        
    }
    }
    
    
    @IBAction func registar(_ sender: UIButton) {
        
        if let pa = Double(tfPA.text!){
            
           let now = Date()

            let newRegistry = Registry(date: now, pa: Int(pa), ca: Int(tfFC.text!)!, fc: Int(tfCA.text!)!)
            
            
            registries.append(newRegistry)
            
            do {
                // Create JSON Encoder
                let encoder = JSONEncoder()

                // Encode Note
                let data = try encoder.encode(registries)
                    
                // Write/Set Data
                UserDefaults.standard.set(data, forKey: "Data")
                
                self.dismiss(animated: true, completion: nil)
            } catch {
                print("Unable to Encode Array of Registryss (\(error))")
            }
            
        }else{
            let alerta = UIAlertController(title: "Ingresa tu P.A", message: "Debe ingresar la presión arterial para continuar.", preferredStyle: .alert)
            
            let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alerta.addAction(accion)
            present(alerta, animated: true, completion: nil)
        }
    }
    

}

