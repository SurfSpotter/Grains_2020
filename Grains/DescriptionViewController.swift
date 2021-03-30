//
//  DescriptionViewController.swift
//  Grains
//
//  Created by Алексей Чигарских on 05.02.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {
    static let shared = DescriptionViewController()

    // MARK: - Variables

    let saveInUDBoolStatOfFav = UserDefaults.standard
    var descriptionGrainClass: Grain?

    // Количество ингредиентов
    let constValueOfGrain = 100.0

    @IBOutlet var viewOutlet: UIView! // Фон

    @IBOutlet var grainMainImageOut: UIImageView!

    @IBOutlet var charactersViewOutlet: UIView!

    @IBOutlet var descriptionViewOtlet: UIView!

    @IBOutlet var descLabelOutlet: UILabel!

    @IBOutlet var propotionsLabOut: UILabel!

    @IBOutlet var quantOfGrainOut: UILabel!

    @IBOutlet var quanOfWaterOut: UILabel!

    @IBOutlet var timerButtonOut: UIButton!

    @IBOutlet var caloriesButtonOut: UIButton!

    @IBOutlet var boilTimeLabOut: UILabel!

    @IBOutlet var calMainDescLabOut: UILabel!

    @IBOutlet var descScrollView: UIScrollView!

    // MARK: - Timer

    var timer = Timer()
    var seconds: Int = 0
    var minutes: Int = 0
    var hours: Int = 0
    var timerString: String = ""
    var timerStatus: Bool = false
    var boilTimeInSeconds: Int = 0
    var checkBoilTime: Int = 0
    var startTime: Int = 0
    var boilTimeMinus: Int = 0

    // Outlets

    @IBOutlet var progressBarOut: UIProgressView!

    @IBOutlet var coutndownTimerOut: UILabel!

    @IBOutlet var startButtonOut: UIButton!

    @IBOutlet var setTimeOut: UIButton!

    @IBOutlet var minusButTimerOut: UIButton!

    @IBOutlet var plusButTimerOut: UIButton!

    // Action of timer

    @IBAction func minusButTimerAction(_: Any) {
        if boilTimeInSeconds > 0 {
            boilTimeInSeconds = boilTimeInSeconds - 60
            coutndownTimerOut.text = secondToMMSSFotmatString()

            descriptionGrainClass?.timeOfBoil = boilTimeInSeconds / 60

            progressBar()
        }
    }

    @IBAction func plusButTimerAction(_: Any) {
        boilTimeInSeconds = boilTimeInSeconds + 60
        coutndownTimerOut.text = secondToMMSSFotmatString()
        descriptionGrainClass?.timeOfBoil = boilTimeInSeconds / 60
        progressBar()
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["notification"])
    }

    @IBAction func startButtonAction(_: Any) {
        if timerStatus == false, boilTimeInSeconds >= 1 {
            let startTimeSet: TimeInterval = Date().timeIntervalSince1970
            startTime = Int(startTimeSet) // записываем время старта таймера
            boilTimeMinus = boilTimeInSeconds

            UserNotifications.shared.createNotification(timeInSeconds: boilTimeInSeconds, nameOfGrain: descriptionGrainClass!.name) // Уведомление

            print(startTime)
            print("boilTimeInSeconds \(boilTimeInSeconds)")
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerSelector), userInfo: nil, repeats: true)
            timerStatus = true
            startButtonOut.setTitle("Пауза".localize(), for: .normal)
            progressBar()

            plusButTimerOut.isHidden = true
            minusButTimerOut.isHidden = true
        } else {
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["notification"])
            timer.invalidate()
            startButtonOut.setTitle("Старт".localize(), for: .normal)
            timerStatus = false
            progressBar()
            coutndownTimerOut.text = secondToMMSSFotmatString()
        }
    }

    // set custom time in timer

    @IBAction func setTimeButtonAction(_: Any) {
        minusButTimerOut.isHidden = false
        plusButTimerOut.isHidden = false
        setTimeOut.isHidden = true

        timer.invalidate()

        startButtonOut.setTitle("Старт".localize(), for: .normal)
        timerStatus = false

        boilTimeGiveInSec()
        coutndownTimerOut.text = secondToMMSSFotmatString()

        progressBar()
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["notification"])
    }

    @objc func timerSelector() {
        let time: TimeInterval = Date().timeIntervalSince1970
        let timeInt = Int(time)
        let countDown = timeInt - startTime
        boilTimeInSeconds = boilTimeMinus - countDown
        coutndownTimerOut.text = secondToMMSSFotmatString()
        progressBar()
        if boilTimeInSeconds <= 0 {
            timer.invalidate()
            coutndownTimerOut.text = "Готово!".localize()
            startButtonOut.setTitle("Сброс".localize(), for: .normal)
            boilTimeGiveInSec()
            timerStatus = true

            // Считаем количество раз, сколько пользаватель использовал таймер

            StoreManager.incrementUsedTimerTimes()
        }
    }

    // Making String Time in format 00:00
    func secondToMMSSFotmatString() -> String {
        let seconds: Int = boilTimeInSeconds % 60
        let minutes: Int = boilTimeInSeconds / 60
        if seconds <= 9 {
            return "\(minutes):0\(seconds)"
        }
        return "\(minutes):\(seconds)"
    }

    // function to get boil time in seconds and set him into "boilTimeInSeconds"

    fileprivate func boilTimeGiveInSec() {
        if let inMinutes = descriptionGrainClass?.timeOfBoil {
            boilTimeInSeconds = 60 * inMinutes
        } else {
            print("=====descriptionGrainClass?.timeOfBoil = nil=====")
        }
    }

    fileprivate func progressBar() {
        let startTime = Float((descriptionGrainClass!.timeOfBoil) * 60)
        let goingTime = Float(boilTimeInSeconds) + 0.01
        progressBarOut.progress = 1.0 - (goingTime / startTime)
    }

    // MARK: -  calories Descriprtion

    @IBOutlet var carbLabOut: UILabel!

    @IBOutlet var fatLabOut: UILabel!

    @IBOutlet var protLabOut: UILabel!

    @IBOutlet var in100GrLabOut: UILabel!

    @IBOutlet var calLabOut: UILabel!

    // MARK: Outlets of DescriptipnVC

    @IBOutlet var hwMuchGrainImgOut: NSLayoutConstraint!

    @IBOutlet var hwMuchWaterImgOut: UIImageView!

    // MARK: -  Add to favourites Button

    @IBOutlet var addToFavButOut: UIButton!

    @IBAction func addToFavButAction(_: Any) {
        //Analytics
        AnalyticsManager.shared.logEvent(.add_to_farovites_btn_pressed)
        if descriptionGrainClass != nil {
            if saveInUDBoolStatOfFav.object(forKey: descriptionGrainClass!.name) == nil {
                saveInUDBoolStatOfFav.set(true, forKey: descriptionGrainClass!.name)
                addToFavButOut.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
                animationOfButton()
                print("check New UD, added... Bool is nil")
            } else if saveInUDBoolStatOfFav.object(forKey: descriptionGrainClass!.name) as! Bool == false {
                saveInUDBoolStatOfFav.set(true, forKey: descriptionGrainClass!.name)
                addToFavButOut.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
                animationOfButton()
                print("check New UD, added...Bool is  false")
            } else if saveInUDBoolStatOfFav.object(forKey: descriptionGrainClass!.name) as! Bool == true {
                saveInUDBoolStatOfFav.set(false, forKey: descriptionGrainClass!.name)
                addToFavButOut.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
                print("check New UD, added...Bool is true")
            }
        } else {
            print("Attention! descriptionGrainClass = nil")
        }
    }

    // MARK: - Animation of button

    fileprivate func animationOfButton() {
        addToFavButOut.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)

        UIView.animate(withDuration: 2.0,
                       delay: 0,
                       usingSpringWithDamping: CGFloat(0.20),
                       initialSpringVelocity: CGFloat(6.0),
                       options: UIView.AnimationOptions.allowUserInteraction,
                       animations: {
                           self.addToFavButOut.transform = CGAffineTransform.identity
                       },
                       completion: { _ in () })
    }

    // set image "heart" from User Defaults Status

    fileprivate func setImageFromUsDefBoolStatus() {
        if descriptionGrainClass != nil {
            if saveInUDBoolStatOfFav.object(forKey: descriptionGrainClass!.name) == nil {
                addToFavButOut.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
            } else if saveInUDBoolStatOfFav.object(forKey: descriptionGrainClass!.name) as! Bool == false {
                addToFavButOut.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
            } else if saveInUDBoolStatOfFav.object(forKey: descriptionGrainClass!.name) as! Bool == true {
                addToFavButOut.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
            }
        } else {
            print("Attention! descriptionGrainClass = nil")
        }
    }

    // MARK: - viewDidLoad()

    override func viewDidLoad() {
        // MARK: - Приложение куплено

        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: nPurchaseCompleted), object: nil, queue: nil) { _ in
            print("Notification About purchasing App sended!")
            // Действия после покупки проложения
        }

        super.viewDidLoad()

        if descriptionGrainClass != nil {
            calMainDescLabOut.text = "\(descriptionGrainClass!.caloriesInCcal) ".replacingOccurrences(of: ".0", with: "") + "Ккал".localize()
        }

        navigationItem.title = descriptionGrainClass?.name
        descLabelOutlet.text = descriptionGrainClass?.description

        quanOfWaterOut.text = quanOfWater
        quantOfGrainOut.text = quanOfGrain
        boilTimeLabOut.text = "\(descriptionGrainClass!.timeOfBoil) \(Model.shared.skloneniaMinut(boilTime: descriptionGrainClass!))"
        coutndownTimerOut.text = "\(descriptionGrainClass!.timeOfBoil):00"
        descScrollView.backgroundColor = Model.shared.hexStringToUIColor(hex: descriptionGrainClass!.backgroungColorInHex) // цвет фона из класса крупы
        setGrainImage()
        viewOutlet.backgroundColor = Model.shared.hexStringToUIColor(hex: descriptionGrainClass!.backgroungColorInHex) // цвет фона из класса крупы
        setGrainImage()
        hideTimerViewItems()

        hideCaloriesViewItems()
        backButtomOut.isHidden = true
        setImageFromUsDefBoolStatus()

        settingsCharactersViewOutlet()
        settingsDescriptionViewOtlet()

        // timer
        boilTimeGiveInSec()
    }

    override func viewDidAppear(_: Bool) {
        if timesOfFreeTimerUsesRemaining > 1 {
            animationOfButton(item: timerButtonOut)
            animationOfButton(item: caloriesButtonOut)
        }

        quanOfWaterOut.text = quanOfWater
        quantOfGrainOut.text = quanOfGrain
    }

    @IBAction func setTimerAction(_: Any) {
        //Analytics
        AnalyticsManager.shared.logEvent(.timer_btn_pressed)
        alertAndPurshasingForTimer()
        UserNotifications.shared.requestAuthorization()
    }

    // MARK: Установи количество бесплатных таймеров здесь

    // Устанавливаем число бесплатных таймеров

    let timesOfFreeTimerUsesRemaining = 4 - UserDefaults.standard.integer(forKey: "timerCounts")

    fileprivate func alertAndPurshasingForTimer() {
        print("udPurchasing: \(UserDefaults.standard.bool(forKey: "luffNoisrev"))")
        UserDefaults.standard.synchronize()

        // Устанавливаем число бесплатных таймеров

        // print("timesOfFreeTimerUsesRemaining:  \(timesOfFreeTimerUsesRemaining)")
        print("timesOfFreeTimerUsesRemaining:  \(timesOfFreeTimerUsesRemaining)")
        if timesOfFreeTimerUsesRemaining > 3, !StoreManager.ifFullVersion {
            animationOfView(item: charactersViewOutlet)
            hideMainItems()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.boilTimeGiveInSec()

                self.showHiddenTimerViewItems()
                self.backButtomOut.isHidden = false
            }
        } else if timesOfFreeTimerUsesRemaining == 3, !StoreManager.ifFullVersion
        // UserDefaults.standard.bool(forKey:"luffNoisrev") == false
        {
            animationOfView(item: charactersViewOutlet)
            hideMainItems()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.boilTimeGiveInSec()

                self.showHiddenTimerViewItems()
                self.backButtomOut.isHidden = false

                let alertTimesOfUseTimerIsLimited = UIAlertController(title: "Пользуйтесь на здоровье!".localize(), message: "Осталось ".localize() + "\(self.timesOfFreeTimerUsesRemaining)" + " бесплатных таймера".localize(), preferredStyle: .alert)
                alertTimesOfUseTimerIsLimited.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alertTimesOfUseTimerIsLimited, animated: true, completion: nil)
            }
        } else if timesOfFreeTimerUsesRemaining == 2, !StoreManager.ifFullVersion {
            animationOfView(item: charactersViewOutlet)
            hideMainItems()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.boilTimeGiveInSec()

                self.showHiddenTimerViewItems()
                self.backButtomOut.isHidden = false

                let alertTimesOfUseTimerIsLimited = UIAlertController(title: "Пользуйтесь на здоровье!".localize(), message: "Осталось ".localize() + "\(self.timesOfFreeTimerUsesRemaining)" + " бесплатных таймера".localize(), preferredStyle: .alert)
                alertTimesOfUseTimerIsLimited.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

                self.present(alertTimesOfUseTimerIsLimited, animated: true, completion: nil)
            }
        } else if timesOfFreeTimerUsesRemaining == 1, !StoreManager.ifFullVersion {
            animationOfView(item: charactersViewOutlet)
            hideMainItems()

            hideMainItems()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.boilTimeGiveInSec()
                self.showHiddenTimerViewItems()
                self.backButtomOut.isHidden = false

                let alertTimesOfUseTimerIsLimited = UIAlertController(title: "Пользуйтесь на здоровье!".localize(), message: "Осталось ".localize() + "\(self.timesOfFreeTimerUsesRemaining)" + " бесплатных таймера".localize(), preferredStyle: .alert)
                alertTimesOfUseTimerIsLimited.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alertTimesOfUseTimerIsLimited, animated: true, completion: nil)
            }
        } else if timesOfFreeTimerUsesRemaining <= 0, !StoreManager.ifFullVersion {
            let alertTimesOfUseTimerIsLimited = UIAlertController(title: "Полная версия\n по цене двух яблок!".localize(), message: "Бесплатные таймеры законились. \nКупить?".localize(), preferredStyle: .alert)
            alertTimesOfUseTimerIsLimited.addAction(UIAlertAction(title: "Да".localize(), style: .default, handler: { _ in
                StoreManager.share.buyInApp(inAppId: "grainsFullversion1")
            }))
            alertTimesOfUseTimerIsLimited.addAction(UIAlertAction(title: "Нет".localize(), style: .default, handler: nil))

            present(alertTimesOfUseTimerIsLimited, animated: true, completion: nil)
        } else {
            animationOfView(item: charactersViewOutlet)
            hideMainItems()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.boilTimeGiveInSec()

                self.showHiddenTimerViewItems()
                self.backButtomOut.isHidden = false
            }
        }
    }

    // При нажатии на кнопку, переворачивется экран и показываются калории

    @IBAction func showCaloriesButton(_: Any) {
        //Analytics
        AnalyticsManager.shared.logEvent(.calories_btn_pressed)
        animationOfView(item: charactersViewOutlet)
        hideMainItems()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.backButtomOut.isHidden = false
            if self.descriptionGrainClass != nil {
                self.carbLabOut.isHidden = false
                self.carbLabOut.text = "Углеводов: ".localize() + "\(String(describing: self.descriptionGrainClass!.carbohydrate))" + "г".localize()
                self.protLabOut.isHidden = false
                self.protLabOut.text = "Белков: ".localize() + "\(String(describing: self.descriptionGrainClass!.protein))" + "г".localize()
                self.fatLabOut.isHidden = false
                self.fatLabOut.text = "Жиров: ".localize() + "\(String(describing: self.descriptionGrainClass!.fat))" + "г".localize()
                self.in100GrLabOut.isHidden = false

                if UserDefaults.standard.integer(forKey: "uDSelectedMeasureIntCell") == 1 {
                    self.in100GrLabOut.text = "В 3,5 унциях содержится: ".localize()
                } else {
                    self.in100GrLabOut.text = "В 100 граммах содержится: ".localize()
                }

                self.calLabOut.isHidden = false
                self.calLabOut.text = "Калорийность: ".localize() + "\(self.descriptionGrainClass!.caloriesInCcal)".replacingOccurrences(of: ".0", with: "") + " ккал".localize() // убираем ".0"
            }
        }
    }

    @IBOutlet var backButtomOut: UIButton!

    @IBAction func backButtonAction(_: Any) {
        animationOfView(item: charactersViewOutlet)
        backButtomOut.isHidden = true
        hideTimerViewItems()
        hideCaloriesViewItems()
        boilTimeLabOut.text = "\(descriptionGrainClass!.timeOfBoil) \(Model.shared.skloneniaMinut(boilTime: descriptionGrainClass!))"

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.timer.invalidate()
            self.boilTimeGiveInSec()
            self.coutndownTimerOut.text = self.secondToMMSSFotmatString()
            self.timerStatus = false
            self.startButtonOut.titleLabel?.text = "Старт".localize()
            self.progressBar()

            self.showHiddenMainItems()
        }

        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["notification"])
    }

    // MARK: - Загружаем изображение для класса этой крупы

    fileprivate func setGrainImage() {
        if descriptionGrainClass?.grainImgName != nil {
            grainMainImageOut.image = UIImage(named: descriptionGrainClass!.grainImgName)
        } else {
            print("image not found!")
        }
    }

    // MARK: - Hide and Show items of menu

    fileprivate func hideMainItems() {
        timerButtonOut.isHidden = true
        caloriesButtonOut.isHidden = true
        boilTimeLabOut.isHidden = true
        calMainDescLabOut.isHidden = true
    }

    // Show hidden main menu items

    fileprivate func showHiddenMainItems() {
        timerButtonOut.isHidden = false
        caloriesButtonOut.isHidden = false
        boilTimeLabOut.isHidden = false
        calMainDescLabOut.isHidden = false
    }

    fileprivate func hideCaloriesViewItems() {
        // Hide the labels in calories description Window

        carbLabOut.isHidden = true
        protLabOut.isHidden = true
        fatLabOut.isHidden = true
        in100GrLabOut.isHidden = true
        calLabOut.isHidden = true
    }

    // Show hidden calories menu items

    fileprivate func showHiddenCaloriesViewItems() {
        // Hide the labels in calories description Window

        carbLabOut.isHidden = false
        protLabOut.isHidden = false
        fatLabOut.isHidden = false
        in100GrLabOut.isHidden = false
        calLabOut.isHidden = false
    }

    // function to hide items

    fileprivate func hideTimerViewItems() {
        progressBarOut.isHidden = true
        coutndownTimerOut.isHidden = true
        startButtonOut.isHidden = true
        setTimeOut.isHidden = true
        minusButTimerOut.isHidden = true
        plusButTimerOut.isHidden = true
    }

    // function to show items
    fileprivate func showHiddenTimerViewItems() {
        progressBarOut.isHidden = false
        coutndownTimerOut.isHidden = false
        startButtonOut.isHidden = false
        setTimeOut.isHidden = false
    }

    // MARK: - Measure types converter:

    var quanOfGrain: String {
        let usDefSegmentContValue = UserDefaults.standard.integer(forKey: "uDSelectedMeasureIntCell")
        switch usDefSegmentContValue {
        case 0:
            return "\(String(round(constValueOfGrain * 10000) / 10000).replacingOccurrences(of: ".0", with: ""))" + " граммов крупы".localize()
        case 1:
            let inOz: Double = round(Double((0.033814 * constValueOfGrain) * 100.00)) / 100.00 // Округляем
            return "\(inOz)" + " Oz крупы".localize()
        case 2:
            let inProportions: Double = 1.0
            let inProportionsStr = String(round(inProportions * 10000) / 10000).replacingOccurrences(of: ".0", with: "") // убираем ноль после запитую

            // Склоняем слово "Чашка"
            var sklCups = "чашки".localize()
            switch inProportions {
            case 0:
                sklCups = "чашек".localize()
            case 0.01 ... 0.99:
                sklCups = "чашки".localize()
            case 1:
                sklCups = "чашка".localize()
            case 6 ... 20:
                sklCups = "чашек".localize()
            default:
                sklCups = "чашки".localize()
            }
            return ("\(inProportionsStr) \(sklCups)" + " крупы".localize())
        default:
            return "default"
        }
    }

    // MARK: Склонения и прочее

    var quanOfWater: String {
        let usDefSegmentContValue = UserDefaults.standard.integer(forKey: "uDSelectedMeasureIntCell")
        switch usDefSegmentContValue {
        case 0:
            let rounded = round(Double(constValueOfGrain / descriptionGrainClass!.proportions) * 10) / 10.00
            return "\(String(rounded).replacingOccurrences(of: ".0", with: ""))" + " мл воды".localize()
        case 1:
            let inOz: Double = round(Double((0.033814 * constValueOfGrain) * 10.00) / descriptionGrainClass!.proportions) / 10.00
            return "\(inOz)" + " Oz воды"
        case 2:

            // let inProportions : Double =  Double(signOf: ( constValueOfGrain / descriptionGrainClass!.proportions  ) / 200,  magnitudeOf: descriptionGrainClass!.proportions)
            let inProportions: Double = round(Double(1.0 / descriptionGrainClass!.proportions) * 10) / 10
            let inProportionInStr = String(inProportions).replacingOccurrences(of: ".0", with: "")

            // Склоняем слово "Чашка"
            var sklCups = "чашки".localize()
            switch inProportions {
            case 0:
                sklCups = "чашек".localize()
            case 0.01 ... 0.99:
                sklCups = "чашки".localize()
            case 1:
                sklCups = "чашка".localize()
            case 5 ... 20:
                sklCups = "чашек".localize()
            default:
                sklCups = "чашки".localize()
            }
            return ("\(inProportionInStr) \(sklCups)" + " воды".localize())
        default:
            return "default"
        }
    }

    fileprivate func settingsCharactersViewOutlet() {
        charactersViewOutlet.layer.cornerRadius = 15
        charactersViewOutlet.layer.masksToBounds = false
        charactersViewOutlet.clipsToBounds = true
        charactersViewOutlet.alpha = 0.9
    }

    fileprivate func settingsDescriptionViewOtlet() {
        descriptionViewOtlet.layer.cornerRadius = 15
        descriptionViewOtlet.layer.masksToBounds = false
        descriptionViewOtlet.clipsToBounds = true
        descriptionViewOtlet.alpha = 0.9
    }

    override func viewWillLayoutSubviews() {
        descLabelOutlet.sizeToFit()
    }

    func animationOfView(item: UIView) {
        let item = item
        UIView.animate(withDuration: 0.6,
                       animations: {
                           item.transform = CGAffineTransform(scaleX: 0.01, y: 0.95)
                       },
                       completion: { _ in
                           UIView.animate(withDuration: 0.6) {
                               item.transform = CGAffineTransform.identity
                           }
                       })
    }

    func animationOfButton(item: UIButton) {
        let item = item
        UIView.animate(withDuration: 0.6,
                       animations: {
                           item.transform = CGAffineTransform(scaleX: 0.8, y: 0.80)
                       },
                       completion: { _ in
                           UIView.animate(withDuration: 0.6) {
                               item.transform = CGAffineTransform.identity
                           }
                       })
    }

    // Checking array to contains doubled classes

    func checkFavArrToContains() -> Bool {
        for names in Model.shared.favGrains {
            if descriptionGrainClass?.name == names.name {
                return true
            }
        }
        return false
    }

    func removeInFavGrainArr() {
        for (index, names) in Model.shared.favGrains.enumerated() {
            if names === descriptionGrainClass {
                Model.shared.favGrains.remove(at: index)
            }
        }
    }
}

// revers bool var
extension Bool {
    mutating func reverse() -> Bool {
        if self == true {
            self = false
            return self
        } else {
            self = true
            return self
        }
    }
}
