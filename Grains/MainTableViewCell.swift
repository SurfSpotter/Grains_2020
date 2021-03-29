//
//  MainTableViewCell.swift
//  Grains
//
//  Created by Алексей Чигарских on 04.02.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    @IBOutlet var imgOfGrain: UIImageView!

    @IBOutlet var nameOfGrainLabel: UILabel!

    @IBOutlet var timeOfBoilLabel: UILabel!

    @IBAction func pushStartTimerAction(_: Any) {}

    static let shared = MainTableViewCell()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func initCell(grain: Grain) {
        imgOfGrain.image = UIImage(named: grain.grainImgName + "300px")
        nameOfGrainLabel.text = grain.name
        timeOfBoilLabel.text = String(grain.timeOfBoil) + " \(Model.shared.skloneniaMinut(boilTime: grain))"
        backgroundColor? = Model.shared.hexStringToUIColor(hex: grain.backgroungColorInHex)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
