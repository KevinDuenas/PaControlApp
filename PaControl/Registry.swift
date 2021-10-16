//
//  Registry.swift
//  PaControl
//
//  Created by Kevin Duenas on 15/10/21.
//

import UIKit

class Registry: Codable {
    var date : Date
    var pa : Int
    var ca : Int
    var fc : Int
    
    init(date: Date, pa : Int, ca : Int = 0, fc : Int = 0){
        self.date = date
        self.pa = pa
        self.ca = ca
        self.fc = fc
        

}
}
