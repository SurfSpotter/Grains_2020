//
//  RateManager.swift
//  Grains
//
//  Created by Алексей Чигарских on 05.03.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import UIKit
import StoreKit

@available (iOS 10.3, *)


//MARK:- Оценка приложения


class RateManager {
    class func incrementCount() {
        let runCounts = UserDefaults.standard.integer(forKey: "runCounts")
            UserDefaults.standard.set(runCounts + 1, forKey: "runCounts")
            UserDefaults.standard.synchronize()
            print ("runCounts incremented. Tolal summary is: \(UserDefaults.standard.integer(forKey: "runCounts"))")
 
        
    }
    class func ShowRateItAppByCount() {
        let runCounts = UserDefaults.standard.integer(forKey: "runCounts")
        if runCounts == 15 { // times how much loads app before SKStoreController Started
            UserDefaults.standard.set(runCounts + 1, forKey: "runCounts")
            DispatchQueue.main.asyncAfter(deadline: .now() + 17) {
                SKStoreReviewController.requestReview()
            }
        }
    }
    class func ShowRateItApp() {
           UserDefaults.standard.set(30 , forKey: "runCounts") // times +1 for show SKStoreManager only one time
           SKStoreReviewController.requestReview()
        
    
}
    class func rate() {
        incrementCount()
        ShowRateItAppByCount()
        }
    class func resetUDRunCount() {
        UserDefaults.standard.set(0 , forKey: "runCounts")
    }
}

