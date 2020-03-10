//
//  File.swift
//  Grains
//
//  Created by Алексей Чигарских on 10.03.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import Foundation
import StoreKit
let nPurchaseCompleted = "nPurchaseCompleted"

class StoreManager: NSObject {
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
      
            print ("нерабочие идентификаторы!")
        
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


/*
 public enum SKPaymentTransactionState : Int {

     
     case purchasing // Transaction is being added to the server queue.

     case purchased // Transaction is in queue, user has been charged.  Client should complete the transaction.

     case failed // Transaction was cancelled or failed before being added to the server queue.

     case restored // Transaction was restored from user's purchase history.  Client should complete the transaction.

     @available(iOS 8.0, *)
     case deferred // The transaction is in the queue, but its final status is pending external action.
 }
 */
