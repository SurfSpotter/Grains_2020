//
//  DescriptionViewController.swift
//  Grains
//
//  Created by Алексей Чигарских on 05.02.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {

    @IBOutlet weak var viewOutlet: UIView!  // Фон

    var descriptionGrainClass: Grain?
    
    @IBOutlet weak var grainMainImageOut: UIImageView!
    
    @IBOutlet weak var charactersViewOutlet: UIView!
    
    @IBOutlet weak var descriptionViewOtlet: UIView!
    
    @IBOutlet weak var descLabelOutlet: UILabel!
    
    @IBOutlet weak var timerButtonOut: UIButton!
    
    @IBOutlet weak var caloriesButtonOut: UIButton!
    
    @IBOutlet weak var boilTimeLabOut: UILabel!
    
    @IBOutlet weak var calMainDescLabOut: UILabel!
    
    
    
    // calories Descriprtion
    
    @IBOutlet weak var carbLabOut: UILabel!
    
    @IBOutlet weak var fatLabOut: UILabel!
    
    @IBOutlet weak var protLabOut: UILabel!
    
    @IBOutlet weak var in100GrLabOut: UILabel!
    
    @IBOutlet weak var calLabOut: UILabel!
    
    // Add to favourites Button
    
    var statusFavButton: Bool = false
    
    
    @IBOutlet weak var addToFavButOut: UIButton!
    
    @IBAction func addToFavButAction(_ sender: Any) {
        
        
        
        //statusFavButton =  statusFavButton.reverse()
        
        
        
        let checking = checkFavArrToContains()
        if checking == false && descriptionGrainClass != nil {
            
            
          // add to Fav array
           addToFavButOut.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
            Model.shared.favGrains.append(descriptionGrainClass!)
            print ("true in grain Check")
    for i in Model.shared.favGrains {
        print (i.name)
    }

            
            
            // Animation of button
                   
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
        else {
            
            
            
            removeInFavGrainArr()
            
            addToFavButOut.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
            
            
            
            
            print ("false in Grain Check")
            print (Model.shared.favGrains.count)
            for i in Model.shared.favGrains {
                print (i.name)
            }
            
            
        }
        
        
       
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        navigationItem.title = descriptionGrainClass?.name
        descLabelOutlet.text = descriptionGrainClass?.description
        viewOutlet.backgroundColor = descriptionGrainClass?.backgroundColour // цвет фона из класса крупы
        setGrainImage()
     
        // Hide the labels in calories description Window
        
        carbLabOut.isHidden = true
        protLabOut.isHidden = true
        fatLabOut.isHidden = true
        in100GrLabOut.isHidden = true
        calLabOut.isHidden = true
        
        
        
        settingsCharactersViewOutlet()
        settingsDescriptionViewOtlet()
        
}
    
    
    @IBAction func setTimerAction(_ sender: Any) {
        animationOfView(item: charactersViewOutlet)
        
    }
    
    
    
    // При нажатии на кнопку, переворачивется экран и показываются калории
    
    @IBAction func showCaloriesButton(_ sender: Any) {
        
        
        
        self.animationOfView(item: self.charactersViewOutlet)
        self.timerButtonOut.isHidden = true
        self.caloriesButtonOut.isHidden = true
        self.boilTimeLabOut.isHidden = true
        calMainDescLabOut.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0 )  {
            
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
    
    
    
    
    
    // MARK: - Загружаем изображение для класса этой крупы
    fileprivate func setGrainImage() {
        
        
        
        
        
        
        
        if descriptionGrainClass?.grainImgName != nil {
            grainMainImageOut.image = UIImage(named: descriptionGrainClass!.grainImgName)
        }
        else {
            print ("image not found!")
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
