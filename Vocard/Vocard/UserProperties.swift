//
//  UserProperties.swift
//  Vocard
//
//  Created by 모설아 on 23/06/2019.
//  Copyright © 2019 Snow. All rights reserved.
//

import Foundation

struct UserProperties {
    static var defaultNum = 40
    
    var numOfVocaPerDay: Int {
        get{
            let num: Int = UserDefaults.standard.integer(forKey: "numOfVocaPerDay")
            guard num != 0 else {
                UserDefaults.standard.set(UserProperties.defaultNum, forKey: "numOfVocaPerDay")
                UserDefaults.standard.synchronize()
                return UserProperties.defaultNum
            }
            
            return num
        } set (userInput){
            UserDefaults.standard.set(userInput, forKey: "numOfVocaPerDay")
        }
    }
}

