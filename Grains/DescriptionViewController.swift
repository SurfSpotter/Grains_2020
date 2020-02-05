//
//  DescriptionViewController.swift
//  Grains
//
//  Created by Алексей Чигарских on 05.02.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {

    @IBOutlet weak var labelOutlet: UILabel!
    
    var descriptionGrainClass: Grain?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(descriptionGrainClass?.name)
       
    }
    

    
}
