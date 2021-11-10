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
    var index : String
    
    init(date: Date, pa : Int, index:String,  ca : Int = 0, fc : Int = 0){
        self.date = Date()
        self.pa = pa
        self.ca = ca
        self.fc = fc
        self.index = index
        

    }
    
   
}
