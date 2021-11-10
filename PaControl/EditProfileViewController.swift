//
//  EditProfileViewController.swift
//  PaControl
//
//  Created by Kevin Duenas on 13/10/21.
//

import UIKit

class EditProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UNUserNotificationCenterDelegate {
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfAC: UITextField!
    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfAge: UITextField!
    @IBOutlet weak var sDRegistry: UISwitch!
    @IBOutlet weak var tpOne: UIDatePicker!
    @IBOutlet weak var tpTwo: UIDatePicker!
    @IBOutlet weak var btSave: UIButton!
    @IBOutlet weak var imgPP2: UIImageView!
    @IBOutlet weak var lbtpTwo: UILabel!
    
    var nombre : String!
    var ca : Int!
    var peso : Float!
    var edad : Int!
    var isTwoEnabled : Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actualizaInterfaz()
        
    }
    @IBAction func quitaTeclado(_ sender: Any) {
        view.endEditing(true)
    }
    
    func actualizaInterfaz() {
        let defaults = UserDefaults.standard
        if let nombreTexto = defaults.value(forKey: "texto") as? String {
            tfName.text = nombreTexto
        }
        let caTexto = defaults.integer(forKey: "enteroCA")
        tfAC.text = String(caTexto)
        
        let pesoTexto = defaults.float(forKey: "flotante")
        tfWeight.text = String(pesoTexto)
        
        let edadTexto = defaults.integer(forKey: "enteroE")
        tfAge.text = String(edadTexto)
        
        let tomaDoble = defaults.bool(forKey: "tomaD")
        sDRegistry.isOn = tomaDoble
        
        let tomaDos = defaults.bool(forKey: "tomalb")
        lbtpTwo.isHidden = tomaDos
        
        let tomaTime = defaults.bool(forKey: "tomaT")
        tpTwo.isHidden = tomaTime
        
        if let dateValue = defaults.object(forKey: "timeKey1") as? Date {
            tpOne.date = dateValue
        }
        
        if let dateValue2 = defaults.object(forKey: "timeKey2") as? Date {
            tpTwo.date = dateValue2
        }
    }
    
    
    @IBAction func guardaDatosInterfaz() {
        let defaults = UserDefaults.standard
        
        defaults.setValue(tfName.text, forKey: "texto")
        defaults.setValue(tfAC.text, forKey: "enteroCA")
        defaults.setValue(tfWeight.text, forKey: "flotante")
        defaults.setValue(tfAge.text, forKey: "enteroE")
        
        defaults.setValue(sDRegistry.isOn, forKey: "tomaD")
        defaults.setValue(lbtpTwo.isHidden, forKey: "tomalb")
        defaults.setValue(tpTwo.isHidden, forKey: "tomaT")
        defaults.setValue(tpOne.date, forKey: "timeKey1")
        
        
        defaults.setValue(tpTwo.date, forKey: "timeKey2")
    }
    
    @IBAction func saveWithButton(_ sender: UIButton) {
        
        guardaDatosInterfaz()
        
        let tabController = presentingViewController as! UITabBarController
        
        let vistaIni = tabController.viewControllers![1] as! ProfileViewController
        //Vista anterior debe traer guardaDatos y actualizainterfaz
        vistaIni.actualizaInterfaz()
        vistaIni.image = imgPP2.image
        
        programNotifications()
        
    }
    
    
    @IBAction func agregarFoto(_ sender: UITapGestureRecognizer) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if tfName.text! == "" || tfAC.text! == "" || tfAge.text! == "" || tfWeight.text! == "" {
            let alerta = UIAlertController(title: "Error", message: "Los campos no deben estar vacios", preferredStyle: .alert)
            let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alerta.addAction(accion)
            present(alerta, animated: true, completion: nil)
            return false
        }
        else{
            
            return true
        }
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vistaIni = segue.destination as! ProfileViewController
        vistaIni.nombre = tfName.text!
        vistaIni.ca = Int(tfAC.text!)
        vistaIni.peso = Float(tfWeight.text!)
        vistaIni.edad = Int(tfAge.text!)
    
    }
    

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let foto = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imgPP2.image = foto
        dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func tomaDoble(_ sender: UISwitch) {
        if sDRegistry.isOn == false {
            lbtpTwo.isHidden = true
            tpTwo.isHidden = true
            isTwoEnabled = false
        } else if sDRegistry.isOn == true {
            lbtpTwo.isHidden = false
            tpTwo.isHidden = false
            isTwoEnabled = true
        }
        
    }
    
    
    func programNotifications(){
        
       
        
        let calendar = Calendar.current
        
        let hourOne = calendar.component(.hour, from: tpOne.date)
        let minutesOne = calendar.component(.minute, from: tpOne.date)
        
        let hourTwo = calendar.component(.hour, from: tpTwo.date)
        let minutesTwo = calendar.component(.minute, from: tpTwo.date)
        
//        print("hora 1->", hourOne)
//        print("minutes 1->", minutesOne)
//        print("hora 2->", hourTwo)
//        print("minutes 2->", minutesTwo)
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                  if success {
                     
                    
                  } else if let error = error {
                      print(error.localizedDescription)
                  }
              }
              UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
              let content = UNMutableNotificationContent()
              content.title = "Es momento! PA #1"
              content.body = "Ingresa a la app."
              content.sound = UNNotificationSound.default

              var dateComponents = DateComponents()
              dateComponents.timeZone = TimeZone.current
              dateComponents.hour = Int(hourOne)
              dateComponents.minute = Int(minutesOne)
        
             
          
          
              let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
              
        
              let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
              
        
              UNUserNotificationCenter.current().add(request)
            
        
        
            if(tpTwo.isHidden == false){
                
                content.title = "Es momento! PA #2"
                
                var dateComponents2 = DateComponents()
                dateComponents2.timeZone = TimeZone.current
                dateComponents2.hour = Int(hourTwo)
                dateComponents2.minute = Int(minutesTwo)
                
                
                let trigger2 = UNCalendarNotificationTrigger(dateMatching: dateComponents2, repeats: true)
                
                let request2 = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger2)
                
                UNUserNotificationCenter.current().add(request2)
                
            }
        
        
    }
    
  
    
}
