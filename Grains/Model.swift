//
//  Data.swift
//  Grains
//
//  Created by Алексей Чигарских on 03.02.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
/*
 1. создать протокол
 2. создать класс круп
 2.1 создать несколько круп тестовых круп (3шт)
 3. создать массив круп
 4. coздать MainViewController
 5. строка поиска
 6. Логика для строки поиска
 
 
 
 
 
 
 
 
 */

import Foundation
import UIKit




// MARK:-  Protocol

protocol GrainProtocol {
    var name: String {get}
    var keyWords: [String] {get}
    var timeOfBoil: Int {get}
    var proportions: Double {get}
    var finalVolume: Double {get}
    
    
    var fat: Double {get}
    var carbohydrate: Double {get}
    var protein: Double {get}
    var caloriesInCcal: Double {get}
    var grainImgName: String {get}
    var description: String {get}
    
    
}


// MARK:-  Class of Grains

class Grain: GrainProtocol {
    
    
    
    var name: String
    
    var keyWords: [String]
    
    var timeOfBoil: Int
    
    var proportions: Double
    
    var finalVolume: Double
    
    var fat: Double
    
    var carbohydrate: Double
    
    var protein: Double
    
    var caloriesInCcal: Double
    
    var description: String
    
    var grainImgName: String
    
    
 //Make constructor
    
    init(name: String, keyWords: [String], timeOfBoil: Int, proportions: Double, finalVolume: Double, fat: Double, carbohydrate: Double , protein: Double , caloriesInCcal: Double , description: String, imageName: String ) {
        self.name = name
        self.keyWords = keyWords
        self.timeOfBoil = timeOfBoil
        self.proportions = proportions
        self.finalVolume = finalVolume
        self.fat = fat
        self.carbohydrate = carbohydrate
        self.protein = protein
        self.caloriesInCcal = caloriesInCcal
        self.description = description
        self.grainImgName = imageName
        //Model.grains.grainsAllTogether.append(self)
    }
    

}

    
    








class Model: NSObject {
    
    //singleTone
    
    static let shared = Model()
    
    // Variables
   
    var grainsAllTogether: [Grain] = []
    
    
    // Grains variable initialized
    
    
    let rice = Grain(name: "Рис",
                     keyWords: ["Рис, Rice, rice, rise, ris"],
                     timeOfBoil: 12,
                     proportions: 0.5,
                     finalVolume: 2, fat: 2,
                     carbohydrate: 2,
                     protein: 4,
                     caloriesInCcal: 5,
                     description: "desc",
                     imageName: "Buckwheat"   )

    let buckwheat = Grain(name: "Гречневая крупа",
                          keyWords: ["buckwheat, Buckwheat, греча, гречка, ядрица, гречиха "],
                          timeOfBoil: 12,
                          proportions: 0.5,
                          finalVolume: 3.0,
                          fat: 13,
                          carbohydrate: 60,
                          protein: 27,
                          caloriesInCcal: 120,
                          description: "description of buckwheat",
                          imageName: "Buckwheat")
    let oatmeal = Grain(name: "Геркулес", keyWords: ["геркулес, овсянка, овес, хлопья"], timeOfBoil: 14, proportions: 0.5, finalVolume: 3, fat: 10, carbohydrate: 50, protein: 40, caloriesInCcal: 200, description: "descripton of oatmeal", imageName: "Oatmeal")
    
  // function to Append Grains into ArrayAllTogether
    
    
    func appendToArr() -> Void {
        grainsAllTogether.append(rice)
        grainsAllTogether.append(buckwheat)
        grainsAllTogether.append(oatmeal)
        
        print("This print from function: appendToArr" )
        for i in Model.shared.grainsAllTogether {
            let name = i.name
            print (name)
        }
        print ("This is all Grains in AllTogetherArray")
        
        
    }
    
    
    
}
