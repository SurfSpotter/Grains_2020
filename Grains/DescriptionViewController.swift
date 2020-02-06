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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = descriptionGrainClass?.name
        viewOutlet.backgroundColor = descriptionGrainClass?.backgroundColour // цвет фона из класса крупы
        setGrainImage()
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
}
