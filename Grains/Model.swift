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
 #5A4235 темная тема
 
 
 
 
 
 
 
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
    var backgroundColour: UIColor {get}
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
    
    var backgroundColour: UIColor
    
 //Make constructor
    
    init(name: String, keyWords: [String], timeOfBoil: Int, proportions: Double, finalVolume: Double, fat: Double, carbohydrate: Double , protein: Double , caloriesInCcal: Double , description: String, imageName: String, backGroundColorRed: CGFloat, backGroundColorGreen: CGFloat, backGroundColorBlue: CGFloat, backGroundColorAlpha: CGFloat ) {
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
        self.backgroundColour = UIColor(red: backGroundColorRed/255, green: backGroundColorGreen/255, blue: backGroundColorBlue/255, alpha: backGroundColorAlpha)
    }
    

}

    
    








class Model: NSObject {
    
    //singleTone
    
    static let shared = Model()
    
    // Variables
   
    var grainsAllTogether: [Grain] = []
    
    var favGrains: [Grain] = []
    
    var testUDFavArr: Grain?

    
    
    
    
    
   
    //MARK: - Grains variable initialized
    
    let boulgour = Grain(name: "Булгур",
                     keyWords: ["Булгур булгур Bulgur bulgur"],
                     timeOfBoil: 25,
                     proportions: 0.5,
                     finalVolume: 2,
                     fat: 0.24,
                     carbohydrate: 14.08,
                     protein: 3.08,
                     caloriesInCcal: 83,
                     description: "Булгур перед варкой промыть в проточной воде, выложив в сито, слить воду и обжарить булгур в кастрюле на растительном масле 1 минуту, добавить кипяток, варить 20 минут под крышкой на тихом огне, помешивая.",
                    imageName: "Ric",
                    backGroundColorRed: 1 ,
                    backGroundColorGreen: 1,
                    backGroundColorBlue: 1,
                    backGroundColorAlpha: 1
    )
    


    let buckwheat = Grain(name: "Гречневая крупа",
                          keyWords: ["buckwheat, Buckwheat, Греча, Гречка, греча, гречка, ядрица, гречиха "],
                          timeOfBoil: 15,
                          proportions: 0.25,
                          finalVolume: 1.0,
                          fat: 2.5,
                          carbohydrate: 72,
                          protein: 13,
                          caloriesInCcal: 360,
                          description: "Гречку засыпают в холодную, немного подсоленную воду, доводят до кипения и варят на самом тихом огне.",
                          imageName: "Buckwheat",
                            backGroundColorRed: 157 ,
                            backGroundColorGreen: 105,
                            backGroundColorBlue: 47,
                            backGroundColorAlpha: 1
    )
    let oatmeal = Grain(name: "Геркулес",
                        keyWords: ["Oatmeal", "oatmeal", "овес", "овсянка", "хлопья", "геркулес"],
                        timeOfBoil: 20,
                        proportions: 0.3,
                        finalVolume: 1,
                        fat: 6.5, carbohydrate: 60,
                        protein: 13,
                        caloriesInCcal: 370,
                        description: "Варить на медленном огне, периодически помешивая",
                        imageName: "Oatmeal",
                        backGroundColorRed: 1 ,
                        backGroundColorGreen: 1,
                        backGroundColorBlue: 1,
                        backGroundColorAlpha: 1
    )
    
    let goroh = Grain(name: "Горох",
                    keyWords: ["Горох горох"],
                    timeOfBoil: 60,
                    proportions: 0.3,
                    finalVolume: 1.0,
                    fat: 2.0,
                    carbohydrate: 53.0,
                    protein: 22.0,
                    caloriesInCcal: 320.0,
                    
                            description: "Чтобы горох быстрее сварился его надо заранее замочить, лучше залить водой (её нужно взять раза в 3-4 больше) и поставить в холодильник. Если забыли об этом с вечера, но у вас есть время, можно залить горох кипятком и дать ему постоять часик. До начала процесса приготовления колотый горох следует хорошо промыть. Еще один вариант ускорения приготовления гороха колотого без замачивания – его прокаливание на сковороде перед приготовлением на небольшом огне в течение 10-15 минут, постоянно помешивая.",
                    imageName: "default" ,
                    backGroundColorRed: 30 ,
                    backGroundColorGreen: 30,
                    backGroundColorBlue: 30,
                    backGroundColorAlpha: 30 )
    
    
    let dolihos = Grain(name: "Долихос",
                        keyWords: ["Долихос долихос dolihos"],
                        timeOfBoil: 120,
                        proportions: 0.25,
                        finalVolume: 1,
                        fat: 1,
                        carbohydrate: 59,
                        protein: 21,
                        caloriesInCcal: 329,
                        description: "Перед тем, как варить долихос (лаблаб), он требует замачивания на 8-10 часов в большом количестве холодной воды. После этой процедуры достаточно промыть долихос и можно варить - залить крупу в кастрюле крутым кипятком с запасом пару сантиметров варить без крышки на тихом огне.",
                        imageName: "default",
                        backGroundColorRed: 157 ,
                        backGroundColorGreen: 105,
                        backGroundColorBlue: 47,
                        backGroundColorAlpha: 1
    )
    
    let kinoa = Grain(name: "Киноа",
                        keyWords: ["киноа Киноа"],
                        timeOfBoil: 15,
                        proportions: 0.5,
                        finalVolume: 1,
                        fat: 7,
                        carbohydrate: 67,
                        protein: 14,
                        caloriesInCcal: 390,
                        description: "Промойте крупу в мелком сите под холодной проточной водой, перетирая и промывая зерна пальцами, чтобы удалить как можно горечи и пенистой воды, которую дает сапонин (горькое вещество растительного происхождения на поверхности зерён). Промывайте в общей сложности 2 минуты.",
                        imageName: "default",
                        backGroundColorRed: 157 ,
                        backGroundColorGreen: 105,
                        backGroundColorBlue: 47,
                        backGroundColorAlpha: 1
    )
    
    let kukuruza = Grain(name: "Кукуруза",
                        keyWords: ["кукуруза Кукуруза"],
                        timeOfBoil: 30,
                        proportions: 0.2,
                        finalVolume: 1,
                        fat: 1,
                        carbohydrate: 80,
                        protein: 7,
                        caloriesInCcal: 360,
                        description: "Сваренную кукурузную кашу желательно сразу употреблять в пищу, так как, если она постоит и остынет, до слипнется и загустеет, независимо от того, была она жидкой или густой до этого.",
                        imageName: "default",
                        backGroundColorRed: 157 ,
                        backGroundColorGreen: 105,
                        backGroundColorBlue: 47,
                        backGroundColorAlpha: 1
    )
    
    let kuskus = Grain(name: "Кускус",
                        keyWords: ["Кускус кускус кус"],
                        timeOfBoil: 5,
                        proportions: 0.5,
                        finalVolume: 1,
                        fat: 1,
                        carbohydrate: 73,
                        protein: 13,
                        caloriesInCcal: 350,
                        description: "Кускус высыпать в кастрюлю и залить его горячей водой, желательно только что закипевшей. Затем накрыть кастрюлю плотной крышкой и дать постоять 5-7 минут. После этого аккуратно взбить кускус вилкой, чтобы он получился рассыпчатым.",
                        imageName: "default",
                        backGroundColorRed: 157 ,
                        backGroundColorGreen: 105,
                        backGroundColorBlue: 47,
                        backGroundColorAlpha: 1
    )
    
    
    
    let manka = Grain(name: "Манная крупа",
                        keyWords: ["Манка манная манка "],
                        timeOfBoil: 7,
                        proportions: 0.1,
                        finalVolume: 1,
                        fat: 1,
                        carbohydrate: 73,
                        protein: 13,
                        caloriesInCcal: 360,
                        description: "Крупу засыпают в кипящее молоко или воду и варят 7 минут постоянно помешивая. После того, как вы снимете кастрюлю с плиты, каше нужно еще минут 10 постоять под крышкой.",
                        imageName: "default",
                        backGroundColorRed: 157 ,
                        backGroundColorGreen: 105,
                        backGroundColorBlue: 47,
                        backGroundColorAlpha: 1
    )
    
    
    let mash = Grain(name: "Маш",
                        keyWords: ["mash Mash маш Маш"],
                        timeOfBoil: 35,
                        proportions: 0.4,
                        finalVolume: 1,
                        fat: 2,
                        carbohydrate: 46,
                        protein: 23.5 ,
                        caloriesInCcal: 300,
                        description: "Рекомендуется предварительно замачивать зеленый маш на несколько часов. Прежде чем отваривать, маш нужно хорошо промыть, и только потом закладывать в кипящую воду.",
                        imageName: "default",
                        backGroundColorRed: 157 ,
                        backGroundColorGreen: 105,
                        backGroundColorBlue: 47,
                        backGroundColorAlpha: 1
    )
    
    
    let nout = Grain(name: "Нут",
                        keyWords: ["Нут нут "],
                        timeOfBoil: 40,
                        proportions: 0.333,
                        finalVolume: 1,
                        fat: 6,
                        carbohydrate: 61,
                        protein: 19 ,
                        caloriesInCcal: 364,
                        description: "Рекомендуется предварительно замачивать около 8 часов или всю ночь. Помните, что при замачивании нут увеличивается в 2–3 раза.",
                        imageName: "default",
                        backGroundColorRed: 157 ,
                        backGroundColorGreen: 105,
                        backGroundColorBlue: 47,
                        backGroundColorAlpha: 1
    )
    
    
    let oatmealNoBoil = Grain(name: "Овсяные хлопья не требующие варки",
                        keyWords: ["овсяные" , "овес", "хлопья" ],
                        timeOfBoil: 5,
                        proportions: 0.5,
                        finalVolume: 1,
                        fat: 6,
                        carbohydrate: 61,
                        protein: 19 ,
                        caloriesInCcal: 364,
                        description: "Залейте хлопья водой или горячим молоком, тщательно размешайте. Накройте крышкой и дайте настояться в течение 3-5 минут. ",
                        imageName: "default",
                        backGroundColorRed: 157 ,
                        backGroundColorGreen: 105,
                        backGroundColorBlue: 47,
                        backGroundColorAlpha: 1
    )
    
    
    let oatmealNo1 = Grain(name: "Овсяные хлопья №1",
                        keyWords: ["овсяные" , "овес", "хлопья" ],
                        timeOfBoil: 10,
                        proportions: 0.33,
                        finalVolume: 1,
                        fat: 7,
                        carbohydrate: 60,
                        protein: 13 ,
                        caloriesInCcal: 380,
                        description: "Варите на медленном огне. Оставьте кашу томиться под крышкой 2-3 минуты.",
                        imageName: "default",
                        backGroundColorRed: 157 ,
                        backGroundColorGreen: 105,
                        backGroundColorBlue: 47,
                        backGroundColorAlpha: 1
    )
    
    
    let oatmealNo2 = Grain(name: "Овсяные хлопья №2",
                        keyWords: ["овсяные" , "овес", "хлопья" ],
                        timeOfBoil: 5,
                        proportions: 0.33,
                        finalVolume: 1,
                        fat: 7,
                        carbohydrate: 60,
                        protein: 13 ,
                        caloriesInCcal: 380,
                        description: "Варите на медленном огне. Оставьте кашу томиться под крышкой 2-3 минуты.",
                        imageName: "default",
                        backGroundColorRed: 157 ,
                        backGroundColorGreen: 105,
                        backGroundColorBlue: 47,
                        backGroundColorAlpha: 1
    )
    
    
    let oatmealNo3 = Grain(name: "Овсяные хлопья №3",
                        keyWords: ["овсяные" , "овес", "хлопья" ],
                        timeOfBoil: 3,
                        proportions: 0.33,
                        finalVolume: 1,
                        fat: 7,
                        carbohydrate: 60,
                        protein: 13 ,
                        caloriesInCcal: 380,
                        description: "Варите на медленном огне. Оставьте кашу томиться под крышкой 2-3 минуты.",
                        imageName: "default",
                        backGroundColorRed: 157 ,
                        backGroundColorGreen: 105,
                        backGroundColorBlue: 47,
                        backGroundColorAlpha: 1
    )
    
    
    
    let perlovka = Grain(name: "Перловая крупа",
    keyWords: ["перловая" , "перловка" ],
    timeOfBoil: 45,
    proportions: 0.2,
    finalVolume: 1,
    fat: 1,
    carbohydrate: 69,
    protein: 10 ,
    caloriesInCcal: 320,
    description: "Если вы предварительно замачивали крупу, то время варки сокращается на 15 минут.",
    imageName: "default",
    backGroundColorRed: 157 ,
    backGroundColorGreen: 105,
    backGroundColorBlue: 47,
    backGroundColorAlpha: 1
    )
    
    
    
  
    
    let polba = Grain(name: "Полба",
       keyWords: ["полба"],
       timeOfBoil: 30,
       proportions: 0.333,
       finalVolume: 1,
       fat: 2.2,
       carbohydrate: 61.2,
       protein: 14.7 ,
       caloriesInCcal: 323,
       description: "Полбу перед варкой промывают, замачивают в холодной воде на час для большей мягкости, заливают в просторной кастрюле холодной водой и варят на тихом огне под крышкой.",
       imageName: "default",
       backGroundColorRed: 157 ,
       backGroundColorGreen: 105,
       backGroundColorBlue: 47,
       backGroundColorAlpha: 1
       )
    
    
    
    let psheno = Grain(name: "Пшено",
    keyWords: ["пшено", "пшеничная"],
    timeOfBoil: 25,
    proportions: 0.333,
    finalVolume: 1,
    fat: 3,
    carbohydrate: 73,
    protein: 11 ,
    caloriesInCcal: 360,
    description: "Пшено обязательно нужно промывать несколько раз (до 5 раз) теплой водой перед варкой, чтобы полностью вымыть всю пыль, мелкие соринки, а также смыть пленку с крупинок, из-за которой они потом могут слипаться и горчить.",
    imageName: "default",
    backGroundColorRed: 157 ,
    backGroundColorGreen: 105,
    backGroundColorBlue: 47,
    backGroundColorAlpha: 1
    )
    
    
    
    let riceBasmati = Grain(name: "Рис Басмати",
    keyWords: ["рис", "басмати"],
    timeOfBoil: 15,
    proportions: 0.5,
    finalVolume: 1,
    fat: 0.6,
    carbohydrate: 76.4,
    protein: 7.6,
    caloriesInCcal: 340,
    description: "Если вода выпарилась, а рис суховат - необходимо добавить кипятка (полстакана кипятка на 1 стакан риса), не перемешивая рис, и варить рис ещё 3-4 минуты, затем попробовать на вкус. ",
    imageName: "default",
    backGroundColorRed: 157 ,
    backGroundColorGreen: 105,
    backGroundColorBlue: 47,
    backGroundColorAlpha: 1
    )
    
    
    let riceArborio = Grain(name: "Рис Арборио",
    keyWords: ["рис", "арборио", "Rice", "Arborio"],
    timeOfBoil: 20,
    proportions: 0.5,
    finalVolume: 1,
    fat: 1.6,
    carbohydrate: 78.8,
    protein: 6.8,
    caloriesInCcal: 338,
    description: "Когда вода начнет бурлить, огонь необходимо уменьшить до минимума, регулярно помешивая большой ложкой.  Ввиду того, что такой рис довольно легко переварить, снимать его с плиты рекомендуется в полуготовом виде. Спустя несколько минут горячий рис дойдет самостоятельно и при этом сохранит свою форму.",
    imageName: "default",
    backGroundColorRed: 157 ,
    backGroundColorGreen: 105,
    backGroundColorBlue: 47,
    backGroundColorAlpha: 1
    )
    
    
    
    let riceWild = Grain(name: "Рис Дикий",
    keyWords: ["рис", "дикий", "Rice", "wild"],
    timeOfBoil: 40,
    proportions: 0.333,
    finalVolume: 1,
    fat: 0.5,
    carbohydrate: 72,
    protein: 14,
    caloriesInCcal: 357,
    description: "Обязательно замачивайте дикий рис, поскольку его зерна являются очень жесткими.",
    imageName: "default",
    backGroundColorRed: 157 ,
    backGroundColorGreen: 105,
    backGroundColorBlue: 47,
    backGroundColorAlpha: 1
    )
    
    
    
    let riceLong = Grain(name: "Рис длиннозерный",
    keyWords: ["рис", "длиннозерный", "Rice"],
    timeOfBoil: 25,
    proportions: 0.5,
    finalVolume: 1,
    fat: 0.66,
    carbohydrate: 80,
    protein: 7,
    caloriesInCcal: 365,
    description: "Если вы варите рис в кастрюле, сначала доведите подсоленную воду до кипения, а после высыпьте в неё крупу. Перемешайте рис один раз, чтобы зёрнышки не прилипали к дну. Затем дождитесь, когда блюдо начнёт бурлить, убавьте огонь до минимума и накройте кастрюлю крышкой.",
    imageName: "default",
    backGroundColorRed: 157 ,
    backGroundColorGreen: 105,
    backGroundColorBlue: 47,
    backGroundColorAlpha: 1
    )
    
    
    let riceSteamed = Grain(name: "Рис пропаренный",
       keyWords: ["рис", "пропаренный"],
       timeOfBoil: 25,
       proportions: 0.5,
       finalVolume: 1,
       fat: 1,
       carbohydrate: 74,
       protein: 7,
       caloriesInCcal: 333,
       description: "При варке рис не перемешивают.",
       imageName: "default",
       backGroundColorRed: 157 ,
       backGroundColorGreen: 105,
       backGroundColorBlue: 47,
       backGroundColorAlpha: 1
       )

    
    let riceJasmin = Grain(name: "Рис Жасмин",
    keyWords: ["рис", "жасмин"],
    timeOfBoil: 30,
    proportions: 0.67,
    finalVolume: 1,
    fat: 1,
    carbohydrate: 76,
    protein: 7.5,
    caloriesInCcal: 340,
    description: "Чтобы рис приготовился равномерно, не рекомендуется крышку",
    imageName: "default",
    backGroundColorRed: 157 ,
    backGroundColorGreen: 105,
    backGroundColorBlue: 47,
    backGroundColorAlpha: 1
    )
    
    
    let riceRound = Grain(name: "Рис Круглозерный",
    keyWords: ["рис", "круглозерный"],
    timeOfBoil: 25,
    proportions: 0.33,
    finalVolume: 1,
    fat: 0.5,
    carbohydrate: 83,
    protein: 6.5,
    caloriesInCcal: 360,
    description: "Перед приговлением промойте рис.",
    imageName: "default",
    backGroundColorRed: 157 ,
    backGroundColorGreen: 105,
    backGroundColorBlue: 47,
    backGroundColorAlpha: 1
    )
    
    
    let soyaBeans = Grain(name: "Соевые бобы",
    keyWords: ["соевые", "бобы"],
    timeOfBoil: 25,
    proportions: 0.5,
    finalVolume: 1,
    fat: 0.5,
    carbohydrate: 83,
    protein: 6.5,
    caloriesInCcal: 360,
    description: "Перед варкой бобы обязательно замочить в холодной воде минимум на 12 часов.",
    imageName: "default",
    backGroundColorRed: 157 ,
    backGroundColorGreen: 105,
    backGroundColorBlue: 47,
    backGroundColorAlpha: 1
    )
    
 /*
     Рис длиннозерный пропаренный
Перед варкой бобы обязательно замочить в холодной воде минимум на 12 часов.
     
     для длиннозёрного — 1 : 1,5–2;
     для среднезёрного — 1 : 2–2,5;
     для круглозёрного — 1 : 2,5–3;
     для пропаренного — 1 : 2;
     для коричневого — 1 : 2,5–3;
     для дикого — 1 : 3,5.

     */
// User Defaults, add To Favourite Array
    
    
    func getUsDefToFavArr () {
        let usDef = UserDefaults.standard
        favGrains.removeAll()
        for i in grainsAllTogether {
            if usDef.bool(forKey: i.name) == true {
                favGrains.append(i)
            }
            
        }
    }
    
   // Склонения минут
    
func skloneniaMinut(boilTime: Grain) -> String {
               switch  boilTime.timeOfBoil  {
                  case 0:
                  return "минут"
                  case 1:
                  return "минута"
                  case 2...4 :
                  return "минуты"
                  case 5...20 :
                  return "минут"
                  case 21:
                  return "минута"
                  case 22...24 :
                  return "минуты"
                  case 25...30 :
                  return "минут"
                  case 31 :
                  return "минута"
                  case 32...34 :
                  return "минуты"
                  case 35...40 :
                  return "минут"
                  case 41 :
                  return "минута"
                  case 42...44 :
                  return "минуты"
                  case 45...50 :
                  return "минут"
                  case 51 :
                  return "минута"
                  case 52...54 :
                  return "минуты"
                  case 55...60 :
                  return "минут"
                  default:
                      return "мин."
                  }
              }
    
  // function to Append Grains into ArrayAllTogether
    
    
    func appendToArr() -> Void {
        //grainsAllTogether.append(boulgour)
        grainsAllTogether.append(buckwheat)
        grainsAllTogether.append(oatmeal)
        grainsAllTogether.append(boulgour)
        grainsAllTogether.append(goroh)
        grainsAllTogether.append(dolihos)
        grainsAllTogether.append(kinoa)
        grainsAllTogether.append(kukuruza)
        grainsAllTogether.append(kuskus)
        grainsAllTogether.append(manka)
        grainsAllTogether.append(mash)
        grainsAllTogether.append(nout)
        grainsAllTogether.append(oatmealNoBoil)
        grainsAllTogether.append(oatmealNo1)
        grainsAllTogether.append(oatmealNo2)
        grainsAllTogether.append(oatmealNo3)
        grainsAllTogether.append(perlovka)
        grainsAllTogether.append(polba)
        grainsAllTogether.append(psheno)
        grainsAllTogether.append(riceBasmati)
        grainsAllTogether.append(riceArborio)
        grainsAllTogether.append(riceWild)
        grainsAllTogether.append(riceLong)
        grainsAllTogether.append(riceSteamed)
        grainsAllTogether.append(riceJasmin)
        grainsAllTogether.append(riceRound)
        grainsAllTogether = grainsAllTogether.sorted {$0.name < $1.name}
        print("This print from function: appendToArr" )
        for i in Model.shared.grainsAllTogether {
            let name = i.name
            print (name)
        }
        print(Model.shared.grainsAllTogether.count)
        print ("This is all Grains in AllTogetherArray")
        
        
    }
    
}
    

