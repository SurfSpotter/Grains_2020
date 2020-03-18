//
//  DescriptionViewController.swift
//  Grains
//
//  Created by Алексей Чигарских on 05.02.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    //MARK: - Variables
    
let  saveInUDBoolStatOfFav = UserDefaults.standard
var descriptionGrainClass: Grain?
    
// Количество ингредиентов
    let constValueOfGrain = 100.0
    
    


    
    
    @IBOutlet weak var viewOutlet: UIView!  // Фон
    
    @IBOutlet weak var grainMainImageOut: UIImageView!
    
    @IBOutlet weak var charactersViewOutlet: UIView!
    
    @IBOutlet weak var descriptionViewOtlet: UIView!
    
    @IBOutlet weak var descLabelOutlet: UILabel!
    
    @IBOutlet weak var propotionsLabOut: UILabel!
    
    @IBOutlet weak var quantOfGrainOut: UILabel!
    
    @IBOutlet weak var quanOfWaterOut: UILabel!
    
    @IBOutlet weak var timerButtonOut: UIButton!
    
    @IBOutlet weak var caloriesButtonOut: UIButton!
    
    @IBOutlet weak var boilTimeLabOut: UILabel!
    
    @IBOutlet weak var calMainDescLabOut: UILabel!
    
    
   
    
   //MARK: - Timer
    
    var timer = Timer()
    var seconds:Int = 0
    var minutes:Int = 0
    var hours:Int = 0
    var timerString:String = ""
    var timerStatus:Bool = false
    var boilTimeInSeconds: Int = 0
    var checkBoilTime: Int = 0
    var startTime: Int = 0
    var boilTimeMinus: Int = 0
    
    // Outlets
    
    @IBOutlet weak var progressBarOut: UIProgressView!
    
    
    @IBOutlet weak var coutndownTimerOut: UILabel!
    
    
    @IBOutlet weak var startButtonOut: UIButton!
    
    
    @IBOutlet weak var setTimeOut: UIButton!
    
    
    @IBOutlet weak var minusButTimerOut: UIButton!
    
    
    @IBOutlet weak var plusButTimerOut: UIButton!
    
    
    
    // Action of timer
    
   
    @IBAction func minusButTimerAction(_ sender: Any) {
        if boilTimeInSeconds > 0 {
            
            boilTimeInSeconds = boilTimeInSeconds - 60
            coutndownTimerOut.text = secondToMMSSFotmatString()
    
            descriptionGrainClass?.timeOfBoil = boilTimeInSeconds / 60
    
        progressBar()
        }
    }
    
    
    @IBAction func plusButTimerAction(_ sender: Any) {
        boilTimeInSeconds = boilTimeInSeconds + 60
        coutndownTimerOut.text = secondToMMSSFotmatString()
        descriptionGrainClass?.timeOfBoil = boilTimeInSeconds / 60
        progressBar()
    }
    
    
    @IBAction func startButtonAction(_ sender: Any) {
        if  timerStatus == false && boilTimeInSeconds >= 1 {
        let startTimeSet: TimeInterval = Date().timeIntervalSince1970
        startTime = Int(startTimeSet) //записываем время старта таймера
        boilTimeMinus = boilTimeInSeconds
        print (startTime)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerSelector) , userInfo: nil, repeats: true)
        timerStatus = true
            startButtonOut.setTitle("Пауза", for: .normal)
            progressBar()
            
            
            plusButTimerOut.isHidden = true
            minusButTimerOut.isHidden = true
        }
        
        else {
            timer.invalidate()
            startButtonOut.setTitle("Старт", for: .normal)
            timerStatus = false
            progressBar()
            
        }
    }
    
    
    // set custom time in timer
    
    
    @IBAction func setTimeButtonAction(_ sender: Any) {
        minusButTimerOut.isHidden = false
        plusButTimerOut.isHidden = false
        setTimeOut.isHidden = true
        
        timer.invalidate()
        
        startButtonOut.setTitle("Старт", for: .normal)
        timerStatus = false
        
        boilTimeGiveInSec()
        coutndownTimerOut.text = secondToMMSSFotmatString()
        
        progressBar()
        
        
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
            coutndownTimerOut.text = "Готово!"
            startButtonOut.setTitle("Сброс", for: .normal)
            boilTimeGiveInSec()
            timerStatus = true
            
            
            
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
            
        }
        else {
            print ("=====descriptionGrainClass?.timeOfBoil = nil=====")
            
    }

    }
    
    fileprivate func progressBar() {
        let startTime  = Float((descriptionGrainClass!.timeOfBoil) * 60)
        let goingTime = Float(boilTimeInSeconds) + 0.01
        progressBarOut.progress = 1.0 - ( goingTime / startTime)
        
    }
    
    
    //MARK:-  calories Descriprtion
    
    @IBOutlet weak var carbLabOut: UILabel!
    
    @IBOutlet weak var fatLabOut: UILabel!
    
    @IBOutlet weak var protLabOut: UILabel!
    
    @IBOutlet weak var in100GrLabOut: UILabel!
    
    @IBOutlet weak var calLabOut: UILabel!
    
    
   
       
    
    
   
    //MARK: -  Add to favourites Button
    
    
    @IBOutlet weak var addToFavButOut: UIButton!
    
    
    
    @IBAction func addToFavButAction(_ sender: Any) {
        
        if descriptionGrainClass != nil {
        
            if saveInUDBoolStatOfFav.object(forKey: descriptionGrainClass!.name) == nil {
                saveInUDBoolStatOfFav.set(true, forKey: descriptionGrainClass!.name)
                addToFavButOut.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
                animationOfButton()
            print ("check New UD, added... Bool is nil")
                
        }
            else if saveInUDBoolStatOfFav.object(forKey: descriptionGrainClass!.name) as! Bool == false {
                    saveInUDBoolStatOfFav.set(true, forKey: descriptionGrainClass!.name)
                    addToFavButOut.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
                    animationOfButton()
                print ("check New UD, added...Bool is  false")
                    
            }
            
            else if saveInUDBoolStatOfFav.object(forKey: descriptionGrainClass!.name) as! Bool == true {
                    saveInUDBoolStatOfFav.set(false, forKey: descriptionGrainClass!.name)
                    addToFavButOut.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
                print ("check New UD, added...Bool is true")
                    
            }
            }
            
        else {
            print ("Attention! descriptionGrainClass = nil")
        }
        
    
       
    }
    
    
     // Animation of button
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
                       completion: { Void in()  }
        )
    }
    
    // set image "heart" from User Defaults Status
       
       fileprivate func setImageFromUsDefBoolStatus() {
          
           
           
           if descriptionGrainClass != nil {
               
               if saveInUDBoolStatOfFav.object(forKey: descriptionGrainClass!.name) == nil {
                   addToFavButOut.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
               }
               else if saveInUDBoolStatOfFav.object(forKey: descriptionGrainClass!.name) as! Bool == false {
                   addToFavButOut.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
                   
               }
                   
               else if saveInUDBoolStatOfFav.object(forKey: descriptionGrainClass!.name) as! Bool == true {
                   addToFavButOut.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
                   
               }
           }
               
           else {
               print ("Attention! descriptionGrainClass = nil")
               
           }
       }
       
   
    // MARK: - viewDidLoad()
    
    override func viewDidLoad() {
        
        
        //MARK: - Приложение куплено
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: nPurchaseCompleted), object: nil, queue: nil) { (notification) in
            print ("Notification About purchasing App sended!")
            // Действия после покупки проложения
        }
        
        super.viewDidLoad()
        
        if descriptionGrainClass != nil {
        calMainDescLabOut.text = "\(descriptionGrainClass!.caloriesInCcal)  Ккал".replacingOccurrences(of: ".0", with: "") }
    
        navigationItem.title = descriptionGrainClass?.name
        descLabelOutlet.text = descriptionGrainClass?.description
        
        quanOfWaterOut.text = quanOfWater
        quantOfGrainOut.text = quanOfGrain
        boilTimeLabOut.text = "\(descriptionGrainClass!.timeOfBoil) минут"
        coutndownTimerOut.text = "\(descriptionGrainClass!.timeOfBoil):00"
        viewOutlet.backgroundColor = descriptionGrainClass?.backgroundColour // цвет фона из класса крупы
        setGrainImage()
        hideTimerViewItems()
     
        hideCaloriesViewItems()
        self.backButtomOut.isHidden = true
        setImageFromUsDefBoolStatus()
        
        
        
        
        settingsCharactersViewOutlet()
        settingsDescriptionViewOtlet()
        
        
        // timer
        boilTimeGiveInSec()
        
        
        
        
}
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        
        quanOfWaterOut.text = quanOfWater
        quantOfGrainOut.text = quanOfGrain
    }
    
    
    @IBAction func setTimerAction(_ sender: Any) {
        animationOfView(item: charactersViewOutlet)
        hideMainItems()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0 )  {
            self.boilTimeGiveInSec()
            
            
            self.showHiddenTimerViewItems()
            self.backButtomOut.isHidden = false
            
            
        }
        
        
    }
    
    
    
    // При нажатии на кнопку, переворачивется экран и показываются калории
    
    
    
    @IBAction func showCaloriesButton(_ sender: Any) {
        
        
        
        self.animationOfView(item: self.charactersViewOutlet)
        hideMainItems()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0 )  {
            self.backButtomOut.isHidden = false
            if (self.descriptionGrainClass) != nil {
                self.carbLabOut.isHidden = false
                self.carbLabOut.text = " Углеводов: \(String(describing: self.descriptionGrainClass!.carbohydrate) )"
                self.protLabOut.isHidden = false
                self.protLabOut.text = " Белков: \(String(describing: self.descriptionGrainClass!.protein) )"
                self.fatLabOut.isHidden = false
                self.fatLabOut.text = " Жиров: \(String(describing: self.descriptionGrainClass!.fat) )"
                self.in100GrLabOut.isHidden = false
                self.in100GrLabOut.text = "В 100 граммах содержиться: "
                self.calLabOut.isHidden = false
                self.calLabOut.text = "Калорийность \(self.descriptionGrainClass!.caloriesInCcal)ккал"
            }
            
        }
        
       
    }
    
    @IBOutlet weak var backButtomOut: UIButton!
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.animationOfView(item: self.charactersViewOutlet)
        backButtomOut.isHidden = true
        hideTimerViewItems()
        hideCaloriesViewItems()
        boilTimeLabOut.text = "\(descriptionGrainClass!.timeOfBoil) мин."
        
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0 )  {
            
            self.timer.invalidate()
            self.boilTimeGiveInSec()
            self.coutndownTimerOut.text = self.secondToMMSSFotmatString()
            self.timerStatus = false
            self.startButtonOut.titleLabel?.text = "Старт"
            self.progressBar()
            
            self.showHiddenMainItems()
        }
        
        
        
        
        
        
    }
    
    
    
    // MARK: - Загружаем изображение для класса этой крупы
    fileprivate func setGrainImage() {
        
        
        
        
        
        
        
        if descriptionGrainClass?.grainImgName != nil {
            grainMainImageOut.image = UIImage(named: descriptionGrainClass!.grainImgName)
        }
        else {
            print ("image not found!")
        }
    }
    
    
    //MARK: - Hide and Show items of menu
    
    fileprivate func hideMainItems() {
        self.timerButtonOut.isHidden = true
        self.caloriesButtonOut.isHidden = true
        self.boilTimeLabOut.isHidden = true
        calMainDescLabOut.isHidden = true
    }
    
    // Show hidden main menu items
    
    fileprivate func showHiddenMainItems() {
        self.timerButtonOut.isHidden = false
        self.caloriesButtonOut.isHidden = false
        self.boilTimeLabOut.isHidden = false
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
    
    
    //MARK: - Measure types converter:
    
    var quanOfGrain: String {
        let usDefSegmentContValue = UserDefaults.standard.integer(forKey: "uDSelectedMeasureIntCell")
        switch usDefSegmentContValue {
        case 0:
            return "\(String(constValueOfGrain).replacingOccurrences(of: ".0", with: "")) граммов крупы"
        case 1:
            let inOz : Double =  round(Double((0.033814 * constValueOfGrain)*100.00)) / 100.00 // Округляем
        return "\(inOz) Oz крупы"
        case 2:
            let inProportions : Double = 1.0
            let inProportionsStr = String(inProportions).replacingOccurrences(of: ".0", with: "") // убираем ноль после запитую
            
            // Склоняем слово "Чашка"
            var sklCups = "чашки"
            switch inProportions  {
            case 0:
                sklCups = "чашек"
            case 0.01...0.99:
            sklCups = "чашки"
            case 1:
            sklCups = "чашка"
            case 6...20:
            sklCups = "чашек"
            default:
                sklCups = "чашки"
            }
            return ("\(inProportionsStr) \(sklCups) крупы")
        default:
            return "default"
        }
        
    }
    
    
    
    
    var quanOfWater: String  {
        let usDefSegmentContValue = UserDefaults.standard.integer(forKey: "uDSelectedMeasureIntCell")
        switch usDefSegmentContValue {
           case 0:
            let rounded = round(Double(constValueOfGrain / descriptionGrainClass!.proportions) * 10) / 10.00
            return "\(String(rounded).replacingOccurrences(of: ".0", with: "")) мл воды"
           case 1:
            let inOz : Double =  round(Double((0.033814 * constValueOfGrain)*10.00) / descriptionGrainClass!.proportions ) / 10.00
           return "\(inOz) Oz воды"
           case 2:
               
               //let inProportions : Double =  Double(signOf: ( constValueOfGrain / descriptionGrainClass!.proportions  ) / 200,  magnitudeOf: descriptionGrainClass!.proportions)
            let inProportions: Double = round(Double((1.0 / descriptionGrainClass!.proportions)) * 10) / 10
            let inProportionInStr: String = String(inProportions).replacingOccurrences(of: ".0", with: "")
            
             // Склоняем слово "Чашка"
               var sklCups = "чашки"
               switch inProportions  {
               case 0:
                   sklCups = "чашек"
               case 0.01...0.99:
                sklCups = "чашки"
               case 1:
               sklCups = "чашка"
               case 5...20:
               sklCups = "чашек"
               default:
                   sklCups = "чашки"
               }
               return ("\(inProportionInStr) \(sklCups) воды")
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
    
    func animationOfView(item: UIView ) {
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
        for (index,names) in Model.shared.favGrains.enumerated() {
            if names === descriptionGrainClass {
                Model.shared.favGrains.remove(at: index) }
           }
    }
    
    
    
    
}


// revers bool var
extension Bool{
    mutating func reverse() -> Bool{
        if self == true {
            self = false
            return self
        } else {
          self = true
          return self
        }
    }
}
