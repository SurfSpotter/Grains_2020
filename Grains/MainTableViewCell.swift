//
//  MainTableViewCell.swift
//  Grains
//
//  Created by Алексей Чигарских on 04.02.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var imgOfGrain: UIImageView!
    
    @IBOutlet weak var nameOfGrainLabel: UILabel!
   
    @IBOutlet weak var timeOfBoilLabel: UILabel!
    
    @IBAction func pushStartTimerAction(_ sender: Any) {
    }
    
   
    static let shared = MainTableViewCell()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func initCell (grain: Grain) {
        
        
        
  // Склонения(Знаю что костыль))))
        
       
        
        imgOfGrain.image = UIImage(named: grain.grainImgName)
        nameOfGrainLabel.text = grain.name
        timeOfBoilLabel.text = String(grain.timeOfBoil) + " \(Model.shared.skloneniaMinut(boilTime: grain))"
        self.backgroundColor? = grain.backgroundColour
        
        
        

    }
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

   
   
    
}
