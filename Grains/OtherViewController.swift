//
//  OtherViewController.swift
//  Grains
//
//  Created by Алексей Чигарских on 03.03.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import UIKit
import MessageUI

class OtherViewController: UIViewController {

let buyInApp = StoreManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: nPurchaseCompleted), object: nil, queue: nil) { (notification) in
            print ("Notification About purchasing App sended!")
        }
        tabBarController?.tabBar.alpha = 0.9
        mesuresSCOutlet.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "uDSelectedMeasureIntCell")
       
    }
    
    // MARK: - Outlets:
    
    
    @IBOutlet weak var mesuresSCOutlet: UISegmentedControl!
    
    
    
    
    
   //MARK: - Buttons: Actions

    
    @IBAction func rateAppButtonAction(_ sender: Any) {
        RateManager.ShowRateItApp()
    }
    
    
    ///! Do purschase the App Function!
    @IBAction func purchaseFullVersion(_ sender: Any) {
        buyInApp.buyInApp(inAppId: "grainsFullversion1")
        
        
        
    }
    
    @IBAction func shareButtonAction(_ sender: Any) {
        
           
            let urlForSharing : NSURL = NSURL(string: "http://surfspotdevelopco.tilda.ws")!
            let desctriptionForSharing = "Привет! Скачай вот это приложение \(urlForSharing) уверен тебе понравится!"
            
            
            let vc = UIActivityViewController(activityItems: [desctriptionForSharing], applicationActivities: [])
            vc.excludedActivityTypes = [ .airDrop,
                                         .assignToContact,
                                         .openInIBooks,
                                         .markupAsPDF,
                                         .print,
                                         
        ]
            present(vc, animated: true)
        

        
    }
    
    @IBAction func wtiteToDeveloperButtAction(_ sender: Any) {
        showMailComposer()
    }
    
    @IBAction func selectMeasuteSCAction(_ sender: UISegmentedControl) {
        OtherViewController.self.uDSelectedMeasure(segmentedIndex: sender.selectedSegmentIndex)
        
        
        // for testing:
        
        if sender.selectedSegmentIndex == 0 {
            print ("Gramms")
            
        }
        if sender.selectedSegmentIndex == 1 {
            print ("Pounds")
            
        }
        if sender.selectedSegmentIndex == 2 {
            print ("Proportions")
            
        }
    }
    
    
    
    
    
    //MARK: - Send Mail Function
       
       fileprivate func showMailComposer() {
           guard MFMailComposeViewController.canSendMail() else {
               let alert = UIAlertController.init(title: "Ошибка", message: "Функция недоступна. Возможно не выполнен вход в почтовую службу", preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (UIAlertAction) in
                   
               }))
               present(alert, animated: true)
               return
           }
           let composer = MFMailComposeViewController()
           composer.mailComposeDelegate = self
           composer.setToRecipients(["surfspotdevelop@gmail.com"])
           composer.setSubject("Grains")
           composer.setMessageBody("Привет! Ваше приложение просто супер!, но я бы добавил...(напишите ваше пожелание)", isHTML: false)
           present(composer, animated: true)
           
       
           
       }
// MARK: UserDefaults function for selected Measure
    
    
    class func uDSelectedMeasure(segmentedIndex: Int) {
        let uDSelectedMeasureInt = UserDefaults.standard.integer(forKey: "uDSelectedMeasureIntCell")
        UserDefaults.standard.set(segmentedIndex, forKey: "uDSelectedMeasureIntCell")
        UserDefaults.standard.synchronize()
        print ("UdSelectedSegmCont is: \(uDSelectedMeasureInt)")
    }
    
    
   

}

extension OtherViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        let alertSendMailOk = UIAlertController.init(title: "Сообщение отправлено!", message: "Благодарим за вас за помощь!", preferredStyle: .alert)
        alertSendMailOk.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (UIAlertAction) in
            
        }))
        //present(alertSendMailOk, animated: true)
        
        
        if let _ = error {
            // show Error Alert
            print ("error when sent email!")
            controller.dismiss(animated: true, completion: nil)
            let alertError = UIAlertController.init(title: "Ошибка при отправке", message: "Повторите попытку позже.", preferredStyle: .alert)
                       alertError.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (UIAlertAction) in
                           
                       }))
                       present(alertError, animated: true)
        }
        
        switch  result {
        case .cancelled:
            print("cancelled")
            controller.dismiss(animated: true, completion: nil)
        case .failed:
            print("failed")
        case .saved:
            print("saved")
        case .sent:
            print ("sent")
            
           
            
        default:
            controller.dismiss(animated: true, completion: nil)
        }
       controller.dismiss(animated: true, completion: nil)
       
    }
}

