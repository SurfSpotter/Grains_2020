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
    
    @IBOutlet weak var calLabOut: UILabel!
    
    
    // calories Descriprtion
    
    @IBOutlet weak var carbLabOut: UILabel!
    
    @IBOutlet weak var fatLabOut: UILabel!
    
    @IBOutlet weak var protLabOut: UILabel!
    
    
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
        
        
        settingsCharactersViewOutlet()
        settingsDescriptionViewOtlet()
        
//
//        self.layer.cornerRadius = self.frame.height / 2
//        self.layer.masksToBounds = false
//        self.clipsToBounds = true
}
    
    
    @IBAction func setTimerAction(_ sender: Any) {
        animationOfView(item: charactersViewOutlet)
        
    }
    
    
    
    // При нажатии на кнопку, переворачивется экран и показываются калории
    
    @IBAction func showCaloriesButton(_ sender: Any) {
        self.animationOfView(item: self.charactersViewOutlet)
        self.timerButtonOut.isHidden = true
        self.caloriesButtonOut.isHidden = true
        self.calLabOut.isHidden = true
        self.boilTimeLabOut.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0 )  {
            
            if (self.descriptionGrainClass) != nil {
                self.carbLabOut.isHidden = false
                self.carbLabOut.text = " Углеводов: \(String(describing: self.descriptionGrainClass!.carbohydrate) )"
                self.protLabOut.isHidden = false
                self.protLabOut.text = " Белков: \(String(describing: self.descriptionGrainClass!.protein) )"
                self.fatLabOut.isHidden = false
                self.fatLabOut.text = " Жиров: \(String(describing: self.descriptionGrainClass!.fat) )" }
           
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
    
    
}
