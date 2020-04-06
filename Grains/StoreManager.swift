//
//  File.swift
//  Grains
//
//  Created by Алексей Чигарских on 10.03.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//
import UIKit
import Foundation
import StoreKit
let nPurchaseCompleted = "nPurchaseCompleted"

class StoreManager: NSObject {
    static let share = StoreManager()
    //MARK: - количество бесплатный использований таймера
   // let freeTimesOfUsetimer = 2
    //let timesOfFreeTimerUsesRemaining = 15 -  (UserDefaults.standard.integer(forKey: "timerCounts"))
    
    // Класс который считает количество завершенных пользователем таймеров
        class func incrementUsedTimerTimes() {
               let runCounts = UserDefaults.standard.integer(forKey: "timerCounts")
                   UserDefaults.standard.set(runCounts + 1, forKey: "timerCounts")
                   UserDefaults.standard.synchronize()
                   print ("timerCounts incremented. Tolal summary is: \(UserDefaults.standard.integer(forKey: "timerCounts"))")
        
               
           }
    
    
    
    class func didBuyFullVersion() {
        UserDefaults.standard.bool(forKey: "luffNoisrev")
        UserDefaults.standard.set(true, forKey: "luffNoisrev")
        UserDefaults.standard.synchronize()
    }
    class var ifFullVersion: Bool {
        return UserDefaults.standard.bool(forKey: "luffNoisrev")
    }
    
    func buyInApp(inAppId: String) {
        if !SKPaymentQueue.canMakePayments() {
            print ("Невозможно соверщать покупки.")
            
        }
        
        let request = SKProductsRequest(productIdentifiers: [inAppId])
        request.delegate = self
        request.start()
    }
    
  
    
    
    
}

extension StoreManager: SKProductsRequestDelegate {
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        if response.products.count > 0 {
            let product = response.products[0]
            let payment = SKPayment(product: product )
            SKPaymentQueue.default().add(self)
            SKPaymentQueue.default().add(payment)
        }
      
        else {print ("нерабочие идентификаторы!")}
        
    }
    
}

extension StoreManager: SKPaymentTransactionObserver {
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction])
    {
        for transaction in transactions {
            if  transaction.transactionState ==  SKPaymentTransactionState.purchasing {
                print ("\(transaction.payment.productIdentifier): purchasing")
                
            }
            if  transaction.transactionState ==  SKPaymentTransactionState.purchased {
                queue.finishTransaction(transaction)
                StoreManager.didBuyFullVersion()
                  print ("\(transaction.payment.productIdentifier): purchased")
                NotificationCenter.default.post(name: NSNotification.Name(nPurchaseCompleted), object: nil)
                
                       }
            if  transaction.transactionState ==  SKPaymentTransactionState.failed {
                queue.finishTransaction(transaction)
                    print ("\(transaction.payment.productIdentifier): failed")
                       }
            if  transaction.transactionState ==  SKPaymentTransactionState.restored {
                queue.finishTransaction(transaction)
                StoreManager.didBuyFullVersion()
                      print ("\(transaction.payment.productIdentifier): restored")
                NotificationCenter.default.post(name: NSNotification.Name(nPurchaseCompleted), object: nil)
                       }
            if  transaction.transactionState ==  SKPaymentTransactionState.deferred {
                       print ("\(transaction.payment.productIdentifier): deferred")
                       }
        }
        
    }
    
}


