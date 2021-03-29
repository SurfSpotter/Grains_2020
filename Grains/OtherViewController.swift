//
//  OtherViewController.swift
//  Grains
//
//  Created by Алексей Чигарских on 03.03.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import MessageUI
import UIKit

class OtherViewController: UIViewController {
    let buyInApp = StoreManager()

    @IBOutlet var buyFullVersionOut: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: nPurchaseCompleted), object: nil, queue: nil) { _ in
//            let alertPurchaseSuccess = UIAlertController(title: "Спасибо за покупку!", message: nil, preferredStyle: .alert)
//            alertPurchaseSuccess.addAction(.init(title: "OK", style: .default , handler: nil))
//            self.present(alertPurchaseSuccess, animated: true, completion: nil)
        }
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: nPurchaseRestored), object: nil, queue: nil) { _ in
            print("print of nPurchaseRestored")
            let alertPurchaseRestored = UIAlertController(title: "Успех!".localize(), message: "Покупка восстановлена.".localize(), preferredStyle: .alert)
            alertPurchaseRestored.addAction(.init(title: "OK", style: .default, handler: nil))
            self.present(alertPurchaseRestored, animated: true, completion: nil)
        }
        tabBarController?.tabBar.alpha = 0.9
        mesuresSCOutlet.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "uDSelectedMeasureIntCell")

//        if UserDefaults.standard.bool(forKey: "luffNoisrev") == true {
//                   buyFullVersionOut.setTitle("У вас неограниченный таймер".localize(), for: .normal)
//
//                     }
//                     else {
//                   buyFullVersionOut.setTitle("Купить неограниченный таймер".localize().localize(), for: .normal)
//
//                     }
    }

    override func viewDidAppear(_: Bool) {
        if UserDefaults.standard.bool(forKey: "luffNoisrev") == true {
            buyFullVersionOut.setTitle("У вас неограниченный таймер".localize(), for: .normal)
        } else {
            buyFullVersionOut.setTitle("Купить неограниченный таймер".localize().localize(), for: .normal)
        }
    }

    // MARK: - Outlets:

    @IBOutlet var mesuresSCOutlet: UISegmentedControl!

    // MARK: - Buttons: Actions

    @IBAction func rateAppButtonAction(_: Any) {
        RateManager.ShowRateItApp()
    }

    /// ! Do purschase the App Function!
    @IBAction func purchaseFullVersion(_: Any) {
        if UserDefaults.standard.bool(forKey: "luffNoisrev") == false {
            buyInApp.buyInApp(inAppId: "grainsFullversion1")
        } else {
            let alertYouDidBuy = UIAlertController(title: "Безлимитный таймер уже куплен!".localize(), message: nil, preferredStyle: .alert)
            alertYouDidBuy.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertYouDidBuy, animated: true, completion: nil)
        }
    }

    @IBAction func shareButtonAction(_: Any) {
        let urlForSharing = URL(string: "itms-apps://itunes.apple.com/app/id1502428665")
        let desctriptionForSharing = "Время варки любимых круп. \nТаймер. Калорийность.\n Скачай, уверен тебе понравится!".localize()
        let imageIcon = UIImage(named: "launch")

        let vc = UIActivityViewController(activityItems: [desctriptionForSharing, imageIcon!, urlForSharing!], applicationActivities: [])
        vc.excludedActivityTypes = [.airDrop,
                                    .assignToContact,
                                    .openInIBooks,
                                    .markupAsPDF,
                                    .print]
        present(vc, animated: true)
    }

    @IBAction func wtiteToDeveloperButtAction(_: Any) {
        showMailComposer()
    }

    @IBAction func restorePurchase(_: Any) {
        StoreManager.share.restorePurchase()
    }

    @IBAction func selectMeasuteSCAction(_ sender: UISegmentedControl) {
        OtherViewController.uDSelectedMeasure(segmentedIndex: sender.selectedSegmentIndex)

        // for testing:

        if sender.selectedSegmentIndex == 0 {
            print("Gramms")
        }
        if sender.selectedSegmentIndex == 1 {
            print("Pounds")
        }
        if sender.selectedSegmentIndex == 2 {
            print("Proportions")
        }
    }

    // MARK: - Send Mail Function

    fileprivate func showMailComposer() {
        guard MFMailComposeViewController.canSendMail() else {
            let alert = UIAlertController(title: "Ошибка".localize(), message: "Функция недоступна. Возможно не выполнен вход в почтовую службу".localize(), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { _ in

            }))
            present(alert, animated: true)
            return
        }
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["surfspotdevelop@gmail.com"])
        composer.setSubject("Grains and Cereals")
        composer.setMessageBody("Привет! Ваше приложение просто супер!, но я бы добавил...(напишите ваше пожелание)".localize(), isHTML: false)
        present(composer, animated: true)
    }

    // MARK: UserDefaults function for selected Measure

    class func uDSelectedMeasure(segmentedIndex: Int) {
        let uDSelectedMeasureInt = UserDefaults.standard.integer(forKey: "uDSelectedMeasureIntCell")
        UserDefaults.standard.set(segmentedIndex, forKey: "uDSelectedMeasureIntCell")
        UserDefaults.standard.synchronize()
        print("UdSelectedSegmCont is: \(uDSelectedMeasureInt)")
    }
}

extension OtherViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        let alertSendMailOk = UIAlertController(title: "Сообщение отправлено!".localize(), message: "Благодарим за вас за помощь!".localize(), preferredStyle: .alert)
        alertSendMailOk.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { _ in

        }))
        present(alertSendMailOk, animated: true)

        if let _ = error {
            // show Error Alert
            print("error when sent email!")
            controller.dismiss(animated: true, completion: nil)
            let alertError = UIAlertController(title: "Ошибка при отправке".localize(), message: "Повторите попытку позже.".localize(), preferredStyle: .alert)
            alertError.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { _ in

            }))
            present(alertError, animated: true)
        }

        switch result {
        case .cancelled:
            print("cancelled")
            controller.dismiss(animated: true, completion: nil)
        case .failed:
            print("failed")
        case .saved:
            print("saved")
        case .sent:
            print("sent")

        default:
            controller.dismiss(animated: true, completion: nil)
        }
        controller.dismiss(animated: true, completion: nil)
    }
}
