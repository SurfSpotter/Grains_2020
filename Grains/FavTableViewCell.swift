//
//  FavTableViewCell.swift
//  Grains
//
//  Created by Алексей Чигарских on 13.02.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import UIKit

class FavTableViewCell: UITableViewCell {

    @IBOutlet weak var imageOut: UIImageView!
    
    @IBOutlet weak var nameOut: UILabel!
    
    @IBOutlet weak var timeBoilOut: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func initCell (grain: Grain) {
        
        
        imageOut.image = UIImage(named: grain.grainImgName)
        nameOut.text = grain.name
        timeBoilOut.text = String(grain.timeOfBoil) + " \(Model.shared.skloneniaMinut(boilTime: grain))"
        self.backgroundColor? = Model.shared.hexStringToUIColor(hex: grain.backgroungColorInHex)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
