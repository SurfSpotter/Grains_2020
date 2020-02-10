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
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = descriptionGrainClass?.name
        descLabelOutlet.text = descriptionGrainClass?.description
        viewOutlet.backgroundColor = descriptionGrainClass?.backgroundColour // цвет фона из класса крупы
        setGrainImage()
        
        
        
        settingsCharactersViewOutlet()
        settingsDescriptionViewOtlet()
        
//
//        self.layer.cornerRadius = self.frame.height / 2
//        self.layer.masksToBounds = false
//        self.clipsToBounds = true
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
       
}
