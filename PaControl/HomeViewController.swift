//
//  HomeViewController.swift
//  PaControl
//
//  Created by Kevin Duenas on 13/10/21.
//

import UIKit
import UserNotifications

class HomeViewController: UIViewController, UNUserNotificationCenterDelegate {
    
    
    //MARK: - Variables
    var fechaString : String = "Hoy, "
    var todayRegistries  = Day()
    var nextRegistry : String = ""
    
    
    // MARK: - Oulets
    @IBOutlet weak var lbDate: UILabel!
    @IBOutlet weak var lbIndications: UILabel!
    @IBOutlet weak var btnRegistry: UIButton!
    
    @IBOutlet weak var imgA1: UIImageView!
    @IBOutlet weak var imgA2: UIImageView!
    @IBOutlet weak var imgA3: UIImageView!
    
    @IBOutlet weak var imgB1: UIImageView!
    @IBOutlet weak var imgB2: UIImageView!
    @IBOutlet weak var imgB3: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().delegate = self
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "es_MX_POSIX")
        dateFormatter.dateFormat = "EEEE dd"
        lbDate.text =  fechaString + dateFormatter.string(from: NSDate() as Date)
        //sendNotification()
       // scheduleNotifications(hour: 11, min: 33)
        loadTodayRegistries()
        changeMarks()
       
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
     
        completionHandler([.alert, .sound])
    }
    
    
    func scheduleNotifications(hour:Int,  min:Int) {
      UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                if success {
                   
                  
                } else if let error = error {
                    print(error.localizedDescription)
                }
            }
            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
            let content = UNMutableNotificationContent()
            content.title = "Es momento de registrar tu presión."
            content.body = "Ingresa a la app."
            content.sound = UNNotificationSound.default

            var dateComponents = DateComponents()
            dateComponents.timeZone = TimeZone.current
            dateComponents.hour = hour
            dateComponents.minute = min
        
        
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request)
    }
    
    @IBAction func sendNotification(){
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10.0, repeats: false)
        
    
        
        let content = UNMutableNotificationContent();
        content.title = "Es momento de tomar tu presión!";
        content.subtitle = "Es mmomento";
        content.body = "Ingresa a la app para registrar tu siguiente prueba.";
        content.sound = UNNotificationSound.default;
        
        let request = UNNotificationRequest(identifier: "ZeldaNotification", content: content, trigger: trigger)
     
        
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
          UNUserNotificationCenter.current().add(request) {(error) in
             if let error = error {
                print("Se ha producido un error: \(error)")
             }
          }
    }
    
    @IBAction func test(_ sender: Any) {
        
        print("ahorita",todayRegistries.A1?.pa)
    }
    
    func loadTodayRegistries(){
        
        
        
        if let data = UserDefaults.standard.data(forKey: "Data") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                let data = try decoder.decode([Registry].self, from: data)
                
               

     
            } catch {
                print("Unable to Decode Notes (\(error))")
            }
        
        }
        
    }
    
    func changeMarks(){
        
        let check = UIImage(named: "check-mark")
        let pending = UIImage(named: "circulation")
        
        imgA1.image = todayRegistries.A1?.pa != nil ? check : pending;
        imgA2.image = todayRegistries.A2?.pa != nil ? check : pending;
        imgA3.image = todayRegistries.A3?.pa != nil ? check : pending;
        imgB1.image = todayRegistries.B1?.pa != nil ? check : pending;
        imgB2.image = todayRegistries.B2?.pa != nil ? check : pending;
        imgB3.image = todayRegistries.B3?.pa != nil ? check : pending;
        
        checkNext()
    }
    
    func checkNext(){
        
        if(todayRegistries.A1?.pa == nil){
            nextRegistry = "A1"
        }else if(todayRegistries.A2?.pa == nil){
            nextRegistry = "A2"
        }else if(todayRegistries.A3?.pa == nil){
            nextRegistry = "A3"
        }else if (todayRegistries.B1?.pa == nil){
            nextRegistry = "B1"
        }else if(todayRegistries.B2?.pa == nil){
            nextRegistry = "B2"
        }else{
            nextRegistry = "B3"
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if (segue.identifier == "RegistrySegue"){
            let registryView = segue.destination as! NewRegistryViewController
            
            registryView.todayRegistries = todayRegistries
            registryView.index = nextRegistry
            
        }
        
    }
    
   
    
    



}
