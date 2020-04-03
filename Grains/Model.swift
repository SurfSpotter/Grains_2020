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
    var backgroungColorInHex: String {get}
    
    
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
    
    var backgroungColorInHex: String
    
    var fat: Double
    
    var carbohydrate: Double
    
    var protein: Double
    
    var caloriesInCcal: Double
    
    var description: String
    
    var grainImgName: String
    
    var backgroundColour: UIColor
    
 //Make constructor
    
    init(name: String, keyWords: [String], timeOfBoil: Int, proportions: Double, backgroungColorInHex: String, fat: Double, carbohydrate: Double , protein: Double , caloriesInCcal: Double , description: String, imageName: String, backGroundColorRed: CGFloat, backGroundColorGreen: CGFloat, backGroundColorBlue: CGFloat, backGroundColorAlpha: CGFloat ) {
        self.name = name
        self.keyWords = keyWords
        self.timeOfBoil = timeOfBoil
        self.proportions = proportions
        self.backgroungColorInHex = backgroungColorInHex
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
                     backgroungColorInHex: "#BE874A",
                     fat: 0.24,
                     carbohydrate: 14.08,
                     protein: 3.08,
                     caloriesInCcal: 83,
                     description: "Булгур перед варкой промыть в проточной воде, выложив в сито, слить воду и обжарить булгур в кастрюле на растительном масле 1 минуту, добавить кипяток, варить 20 минут под крышкой на тихом огне, помешивая.",
                    imageName: "boulgour",
                    backGroundColorRed: 1 ,
                    backGroundColorGreen: 1,
                    backGroundColorBlue: 1,
                    backGroundColorAlpha: 1
    )
    


    let buckwheat = Grain(name: "Гречневая крупа",
                          keyWords: ["buckwheat, Buckwheat, Греча, Гречка, греча, гречка, ядрица, гречиха "],
                          timeOfBoil: 15,
                          proportions: 0.25,
                          backgroungColorInHex: "#B45A17",
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
                        proportions: 0.33333333333,
                        backgroungColorInHex: "#A99364",
                        fat: 6.5, carbohydrate: 60,
                        protein: 13,
                        caloriesInCcal: 370,
                        description: "Варить на медленном огне, периодически помешивая",
                        imageName: "herkuless",
                        backGroundColorRed: 1 ,
                        backGroundColorGreen: 1,
                        backGroundColorBlue: 1,
                        backGroundColorAlpha: 1
    )
    
    let goroh = Grain(name: "Горох",
                    keyWords: ["Горох горох"],
                    timeOfBoil: 60,
                    proportions: 0.33333333333,
                    backgroungColorInHex: "#D1AA85" ,
                    fat: 2.0,
                    carbohydrate: 53.0,
                    protein: 22.0,
                    caloriesInCcal: 320.0,
                    
                            description: "Чтобы горох быстрее сварился его надо заранее замочить, лучше залить водой (её нужно взять раза в 3-4 больше) и поставить в холодильник. Если забыли об этом с вечера, но у вас есть время, можно залить горох кипятком и дать ему постоять часик. До начала процесса приготовления колотый горох следует хорошо промыть. Еще один вариант ускорения приготовления гороха колотого без замачивания – его прокаливание на сковороде перед приготовлением на небольшом огне в течение 10-15 минут, постоянно помешивая.",
                    imageName: "goroh" ,
                    backGroundColorRed: 30 ,
                    backGroundColorGreen: 30,
                    backGroundColorBlue: 30,
                    backGroundColorAlpha: 30 )
    
    
    let dolichos = Grain(name: "Долихос",
                        keyWords: ["Долихос долихос dolihos"],
                        timeOfBoil: 120,
                        proportions: 0.25,
                        backgroungColorInHex: "#D2B566",
                        fat: 1,
                        carbohydrate: 59,
                        protein: 21,
                        caloriesInCcal: 329,
                        description: "Перед тем, как варить долихос (лаблаб), он требует замачивания на 8-10 часов в большом количестве холодной воды. После этой процедуры достаточно промыть долихос и можно варить - залить крупу в кастрюле крутым кипятком с запасом пару сантиметров варить без крышки на тихом огне.",
                        imageName: "dolichos",
                        backGroundColorRed: 157 ,
                        backGroundColorGreen: 105,
                        backGroundColorBlue: 47,
                        backGroundColorAlpha: 1
    )
    
    let kinoa = Grain(name: "Киноа",
                        keyWords: ["киноа Киноа"],
                        timeOfBoil: 15,
                        proportions: 0.5,
                        backgroungColorInHex: "#B5BAC0",
                        fat: 7,
                        carbohydrate: 67,
                        protein: 14,
                        caloriesInCcal: 390,
                        description: "Промойте крупу в мелком сите под холодной проточной водой, перетирая и промывая зерна пальцами, чтобы удалить как можно горечи и пенистой воды, которую дает сапонин (горькое вещество растительного происхождения на поверхности зерён). Промывайте в общей сложности 2 минуты.",
                        imageName: "kinoa",
                        backGroundColorRed: 157 ,
                        backGroundColorGreen: 105,
                        backGroundColorBlue: 47,
                        backGroundColorAlpha: 1
    )
    
    let kukuruza = Grain(name: "Кукуруза",
                        keyWords: ["кукуруза Кукуруза"],
                        timeOfBoil: 30,
                        proportions: 0.2,
                        backgroungColorInHex: "#DE7B0A",
                        fat: 1,
                        carbohydrate: 80,
                        protein: 7,
                        caloriesInCcal: 360,
                        description: "Сваренную кукурузную кашу желательно сразу употреблять в пищу, так как, если она постоит и остынет, до слипнется и загустеет, независимо от того, была она жидкой или густой до этого.",
                        imageName: "kukuruza",
                        backGroundColorRed: 157 ,
                        backGroundColorGreen: 105,
                        backGroundColorBlue: 47,
                        backGroundColorAlpha: 1
    )
    
    let kuskus = Grain(name: "Кускус",
                        keyWords: ["Кускус кускус кус"],
                        timeOfBoil: 5,
                        proportions: 0.5,
                        backgroungColorInHex: "#F8BF79",
                        fat: 1,
                        carbohydrate: 73,
                        protein: 13,
                        caloriesInCcal: 350,
                        description: "Кускус высыпать в кастрюлю и залить его горячей водой, желательно только что закипевшей. Затем накрыть кастрюлю плотной крышкой и дать постоять 5-7 минут. После этого аккуратно взбить кускус вилкой, чтобы он получился рассыпчатым.",
                        imageName: "kuskus",
                        backGroundColorRed: 157 ,
                        backGroundColorGreen: 105,
                        backGroundColorBlue: 47,
                        backGroundColorAlpha: 1
    )
    
    
    
    let semolina = Grain(name: "Манная крупа",
                        keyWords: ["Манка манная манка "],
                        timeOfBoil: 7,
                        proportions: 0.1,
                        backgroungColorInHex: "#C3C7C1",
                        fat: 1,
                        carbohydrate: 73,
                        protein: 13,
                        caloriesInCcal: 360,
                        description: "Крупу засыпают в кипящее молоко или воду и варят 7 минут постоянно помешивая. После того, как вы снимете кастрюлю с плиты, каше нужно еще минут 10 постоять под крышкой.",
                        imageName: "semolina",
                        backGroundColorRed: 157 ,
                        backGroundColorGreen: 105,
                        backGroundColorBlue: 47,
                        backGroundColorAlpha: 1
    )
    
    
    let mash = Grain(name: "Маш",
                        keyWords: ["mash Mash маш Маш"],
                        timeOfBoil: 35,
                        proportions: 0.4,
                        backgroungColorInHex: "#C5A972",
                        fat: 2,
                        carbohydrate: 46,
                        protein: 23.5 ,
                        caloriesInCcal: 300,
                        description: "Рекомендуется предварительно замачивать зеленый маш на несколько часов. Прежде чем отваривать, маш нужно хорошо промыть, и только потом закладывать в кипящую воду.",
                        imageName: "mash",
                        backGroundColorRed: 157 ,
                        backGroundColorGreen: 105,
                        backGroundColorBlue: 47,
                        backGroundColorAlpha: 1
    )
    
    
    let nout = Grain(name: "Нут",
                        keyWords: ["Нут нут "],
                        timeOfBoil: 40,
                        proportions: 0.33333333333,
                        backgroungColorInHex: "#CFB8A4",
                        fat: 6,
                        carbohydrate: 61,
                        protein: 19 ,
                        caloriesInCcal: 364,
                        description: "Рекомендуется предварительно замачивать около 8 часов или всю ночь. Помните, что при замачивании нут увеличивается в 2–3 раза.",
                        imageName: "nout",
                        backGroundColorRed: 157 ,
                        backGroundColorGreen: 105,
                        backGroundColorBlue: 47,
                        backGroundColorAlpha: 1
    )
    
    
    let oatmealNoBoil = Grain(name: "Овсяные хлопья не требующие варки",
                        keyWords: ["овсяные" , "овес", "хлопья" ],
                        timeOfBoil: 5,
                        proportions: 0.5,
                        backgroungColorInHex: "#83665B",
                        fat: 6,
                        carbohydrate: 61,
                        protein: 19 ,
                        caloriesInCcal: 364,
                        description: "Залейте хлопья водой или горячим молоком, тщательно размешайте. Накройте крышкой и дайте настояться в течение 3-5 минут. ",
                        imageName: "oatmealNoBoil",
                        backGroundColorRed: 157 ,
                        backGroundColorGreen: 105,
                        backGroundColorBlue: 47,
                        backGroundColorAlpha: 1
    )
    
    
    let oatmealNo1 = Grain(name: "Овсяные хлопья №1",
                        keyWords: ["овсяные" , "овес", "хлопья" ],
                        timeOfBoil: 10,
                        proportions: 0.33333333333,
                        backgroungColorInHex: "#C1AD93",
                        fat: 7,
                        carbohydrate: 60,
                        protein: 13 ,
                        caloriesInCcal: 380,
                        description: "Варите на медленном огне. Оставьте кашу томиться под крышкой 2-3 минуты.",
                        imageName: "oatmealNo1",
                        backGroundColorRed: 157 ,
                        backGroundColorGreen: 105,
                        backGroundColorBlue: 47,
                        backGroundColorAlpha: 1
    )
    
    
    let oatmealNo2 = Grain(name: "Овсяные хлопья №2",
                        keyWords: ["овсяные" , "овес", "хлопья" ],
                        timeOfBoil: 5,
                        proportions: 0.33333333333,
                        backgroungColorInHex: "#C8C1AC",
                        fat: 7,
                        carbohydrate: 60,
                        protein: 13 ,
                        caloriesInCcal: 380,
                        description: "Варите на медленном огне. Оставьте кашу томиться под крышкой 2-3 минуты.",
                        imageName: "oatmealNo2",
                        backGroundColorRed: 157 ,
                        backGroundColorGreen: 105,
                        backGroundColorBlue: 47,
                        backGroundColorAlpha: 1
    )
    
    
    let oatmealNo3 = Grain(name: "Овсяные хлопья №3",
                        keyWords: ["овсяные" , "овес", "хлопья" ],
                        timeOfBoil: 3,
                        proportions: 0.33333333333,
                        backgroungColorInHex: "#947763",
                        fat: 7,
                        carbohydrate: 60,
                        protein: 13 ,
                        caloriesInCcal: 380,
                        description: "Варите на медленном огне. Оставьте кашу томиться под крышкой 2-3 минуты.",
                        imageName: "oatmealNo3",
                        backGroundColorRed: 157 ,
                        backGroundColorGreen: 105,
                        backGroundColorBlue: 47,
                        backGroundColorAlpha: 1
    )
    
    
    
    let pearlBarley = Grain(name: "Перловая крупа",
    keyWords: ["перловая" , "перловка" ],
    timeOfBoil: 45,
    proportions: 0.2,
    backgroungColorInHex: "#DBBC9E",
    fat: 1,
    carbohydrate: 69,
    protein: 10 ,
    caloriesInCcal: 320,
    description: "Если вы предварительно замачивали крупу, то время варки сокращается на 15 минут.",
    imageName: "pearlBarley",
    backGroundColorRed: 157 ,
    backGroundColorGreen: 105,
    backGroundColorBlue: 47,
    backGroundColorAlpha: 1
    )
    
    
    
  
    
    let polba = Grain(name: "Полба",
       keyWords: ["полба"],
       timeOfBoil: 30,
       proportions: 0.33333333333,
       backgroungColorInHex: "#BC9F82",
       fat: 2.2,
       carbohydrate: 61.2,
       protein: 14.7 ,
       caloriesInCcal: 323,
       description: "Полбу перед варкой промывают, замачивают в холодной воде на час для большей мягкости, заливают в просторной кастрюле холодной водой и варят на тихом огне под крышкой.",
       imageName: "polba",
       backGroundColorRed: 157 ,
       backGroundColorGreen: 105,
       backGroundColorBlue: 47,
       backGroundColorAlpha: 1
       )
    
    
    
    let millet = Grain(name: "Пшено",
    keyWords: ["пшено", "пшеничная"],
    timeOfBoil: 25,
    proportions: 0.33333333333,
    backgroungColorInHex: "#DEB051",
    fat: 3,
    carbohydrate: 73,
    protein: 11 ,
    caloriesInCcal: 360,
    description: "Пшено обязательно нужно промывать несколько раз (до 5 раз) теплой водой перед варкой, чтобы полностью вымыть всю пыль, мелкие соринки, а также смыть пленку с крупинок, из-за которой они потом могут слипаться и горчить.",
    imageName: "millet",
    backGroundColorRed: 157 ,
    backGroundColorGreen: 105,
    backGroundColorBlue: 47,
    backGroundColorAlpha: 1
    )
    
    
    
    let riceBasmati = Grain(name: "Рис Басмати",
    keyWords: ["рис", "басмати"],
    timeOfBoil: 15,
    proportions: 0.5,
    backgroungColorInHex: "#C8C0B9",
    fat: 0.6,
    carbohydrate: 76.4,
    protein: 7.6,
    caloriesInCcal: 340,
    description: "Если вода выпарилась, а рис суховат - необходимо добавить кипятка (полстакана кипятка на 1 стакан риса), не перемешивая рис, и варить рис ещё 3-4 минуты, затем попробовать на вкус. ",
    imageName: "riceBasmati",
    backGroundColorRed: 157 ,
    backGroundColorGreen: 105,
    backGroundColorBlue: 47,
    backGroundColorAlpha: 1
    )
    
    
    let riceArborio = Grain(name: "Рис Арборио",
    keyWords: ["рис", "арборио", "Rice", "Arborio"],
    timeOfBoil: 20,
    proportions: 0.5,
    backgroungColorInHex: "#D1C6B2",
    fat: 1.6,
    carbohydrate: 78.8,
    protein: 6.8,
    caloriesInCcal: 338,
    description: "Когда вода начнет бурлить, огонь необходимо уменьшить до минимума, регулярно помешивая большой ложкой.  Ввиду того, что такой рис довольно легко переварить, снимать его с плиты рекомендуется в полуготовом виде. Спустя несколько минут горячий рис дойдет самостоятельно и при этом сохранит свою форму.",
    imageName: "riceArborio",
    backGroundColorRed: 157 ,
    backGroundColorGreen: 105,
    backGroundColorBlue: 47,
    backGroundColorAlpha: 1
    )
    
    
    
    let riceWild = Grain(name: "Рис Дикий",
    keyWords: ["рис", "дикий", "Rice", "wild"],
    timeOfBoil: 40,
    proportions: 0.33333333333,
    backgroungColorInHex: "#968173",
    fat: 0.5,
    carbohydrate: 72,
    protein: 14,
    caloriesInCcal: 357,
    description: "Обязательно замачивайте дикий рис, поскольку его зерна являются очень жесткими.",
    imageName: "riceWild",
    backGroundColorRed: 157 ,
    backGroundColorGreen: 105,
    backGroundColorBlue: 47,
    backGroundColorAlpha: 1
    )
    
    
    
    let riceLong = Grain(name: "Рис длиннозерный",
    keyWords: ["рис", "длиннозерный", "Rice"],
    timeOfBoil: 25,
    proportions: 0.5,
    backgroungColorInHex: "#6E462D",
    fat: 0.66,
    carbohydrate: 80,
    protein: 7,
    caloriesInCcal: 365,
    description: "Если вы варите рис в кастрюле, сначала доведите подсоленную воду до кипения, а после высыпьте в неё крупу. Перемешайте рис один раз, чтобы зёрнышки не прилипали к дну. Затем дождитесь, когда блюдо начнёт бурлить, убавьте огонь до минимума и накройте кастрюлю крышкой.",
    imageName: "riceLong",
    backGroundColorRed: 157 ,
    backGroundColorGreen: 105,
    backGroundColorBlue: 47,
    backGroundColorAlpha: 1
    )
    
    
    let riceSteamed = Grain(name: "Рис пропаренный",
       keyWords: ["рис", "пропаренный"],
       timeOfBoil: 25,
       proportions: 0.5,
       backgroungColorInHex: "#C5B096",
       fat: 1,
       carbohydrate: 74,
       protein: 7,
       caloriesInCcal: 333,
       description: "При варке рис не перемешивают.",
       imageName: "riceSteamed",
       backGroundColorRed: 157 ,
       backGroundColorGreen: 105,
       backGroundColorBlue: 47,
       backGroundColorAlpha: 1
       )

    
    let riceJasmin = Grain(name: "Рис Жасмин",
    keyWords: ["рис", "жасмин"],
    timeOfBoil: 30,
    proportions: 0.67,
    backgroungColorInHex: "#999589",
    fat: 1,
    carbohydrate: 76,
    protein: 7.5,
    caloriesInCcal: 340,
    description: "Чтобы рис приготовился равномерно, не рекомендуется крышку",
    imageName: "riceJasmin",
    backGroundColorRed: 157 ,
    backGroundColorGreen: 105,
    backGroundColorBlue: 47,
    backGroundColorAlpha: 1
    )
    
    
    let riceRound = Grain(name: "Рис Круглозерный",
    keyWords: ["рис", "круглозерный"],
    timeOfBoil: 25,
    proportions: 0.33333333333,
    backgroungColorInHex: "#ADACAB",
    fat: 0.5,
    carbohydrate: 83,
    protein: 6.5,
    caloriesInCcal: 360,
    description: "Перед приговлением промойте рис.",
    imageName: "riceRound",
    backGroundColorRed: 157 ,
    backGroundColorGreen: 105,
    backGroundColorBlue: 47,
    backGroundColorAlpha: 1
    )
    
    
    let soyaBeans = Grain(name: "Соевые бобы",
    keyWords: ["соевые", "бобы"],
    timeOfBoil: 25,
    proportions: 0.5,
    backgroungColorInHex: "#DFD0C9",
    fat: 0.5,
    carbohydrate: 83,
    protein: 6.5,
    caloriesInCcal: 360,
    description: "Перед варкой бобы обязательно замочить в холодной воде минимум на 12 часов.",
    imageName: "soyaBeans",
    backGroundColorRed: 157 ,
    backGroundColorGreen: 105,
    backGroundColorBlue: 47,
    backGroundColorAlpha: 1
    )
    
    let fasolWhite = Grain(name: "Фасоль белая",
    keyWords: ["фасоль", "белая"],
    timeOfBoil: 50,
    proportions: 0.33333333333,
    backgroungColorInHex: "#726F60",
    fat: 1.6,
    carbohydrate: 55,
    protein: 22.3,
    caloriesInCcal: 324,
    description: "Залить фасоль водой и оставить на время до 10 часов, именно столько времени нужно, чтобы бобы размягчились, а все вредные вещества ушли в воду.",
    imageName: "fasolWhite",
    backGroundColorRed: 157 ,
    backGroundColorGreen: 105,
    backGroundColorBlue: 47,
    backGroundColorAlpha: 1
    )
    
    
    let fasolRed = Grain(name: "Фасоль красная",
    keyWords: ["фасоль", "красная"],
    timeOfBoil: 60,
    proportions: 0.33333333333,
    backgroungColorInHex: "#E66A75",
    fat: 2,
    carbohydrate: 55,
    protein: 22,
    caloriesInCcal: 330,
    description: "Залить фасоль водой и оставить на время до 10 часов, именно столько времени нужно, чтобы бобы размягчились, а все вредные вещества ушли в воду. Перед приготовлением смените воду",
    imageName: "fasolRed",
    backGroundColorRed: 157 ,
    backGroundColorGreen: 105,
    backGroundColorBlue: 47,
    backGroundColorAlpha: 1
    )
    
    
    let chechevicaGreen = Grain(name: "Чечевица зеленая",
    keyWords: ["Чечевица", "зеленая"],
    timeOfBoil: 40,
    proportions: 0.5,
    backgroungColorInHex: "#AE9F8A",
    fat: 2,
    carbohydrate: 65,
    protein: 20,
    caloriesInCcal: 350,
    description: "Замочите в холодной воде на 1–2 часа. Слейте жидкость и промойте под проточной водой.",
    imageName: "chechevicaGreen",
    backGroundColorRed: 157 ,
    backGroundColorGreen: 105,
    backGroundColorBlue: 47,
    backGroundColorAlpha: 1
    )
    
    let chechevicaRed = Grain(name: "Чечевица красная",
    keyWords: ["Чечевица", "красная"],
    timeOfBoil: 15,
    proportions: 0.5,
    backgroungColorInHex: "#D27E5E",
    fat: 1.2,
    carbohydrate: 62.5,
    protein: 24.7,
    caloriesInCcal: 328,
    description: "Красная и жёлтая чечевица не требует замачивания и хорошо разваривается. Выложите промытую чечевицу в кастрюлю и добавьте воду.",
    imageName: "chechevicaRed",
    backGroundColorRed: 157 ,
    backGroundColorGreen: 105,
    backGroundColorBlue: 47,
    backGroundColorAlpha: 1
    )
    
    

    
    let yachnevayaGrain = Grain(name: "Ячневая крупа",
    keyWords: ["Ячневая", "крупа"],
    timeOfBoil: 20,
    proportions: 0.33333333333,
    backgroungColorInHex: "#D7B683",
    fat: 1.3,
    carbohydrate: 67.7,
    protein: 10,
    caloriesInCcal: 324,
    description: "Варить регулярно перемешивая. После варки слить воду и дать постоять под крышкой 15 минут.",
    imageName: "yachnevayaGrain",
    backGroundColorRed: 157 ,
    backGroundColorGreen: 105,
    backGroundColorBlue: 47,
    backGroundColorAlpha: 1
    )
 /*
     
     2688 х 1242 пикселя. В обоих случаях плотность пикселей равна 458 пикселей на дюйм.
     Ячневая крупа
     Ячмень
     Рис длиннозерный пропаренный
     Чечевица зеленая
     chechevicaRed
Перед варкой бобы обязательно замочить в холодной воде минимум на 12 часов.
     
     для длиннозёрного — 1 : 1,5–2;
     для среднезёрного — 1 : 2–2,5;
     для круглозёрного — 1 : 2,5–3;
     для пропаренного — 1 : 2;
     для коричневого — 1 : 2,5–3;
     для дикого — 1 : 3,5.

     */
// User Defaults, add To Favourite Array
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    
    
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
        grainsAllTogether.append(dolichos)
        grainsAllTogether.append(kinoa)
        grainsAllTogether.append(kukuruza)
        grainsAllTogether.append(kuskus)
        grainsAllTogether.append(semolina)
        grainsAllTogether.append(mash)
        grainsAllTogether.append(nout)
        grainsAllTogether.append(oatmealNoBoil)
        grainsAllTogether.append(oatmealNo1)
        grainsAllTogether.append(oatmealNo2)
        grainsAllTogether.append(oatmealNo3)
        grainsAllTogether.append(pearlBarley)
        grainsAllTogether.append(polba)
        grainsAllTogether.append(millet)
        grainsAllTogether.append(riceBasmati)
        grainsAllTogether.append(riceArborio)
        grainsAllTogether.append(riceWild)
        grainsAllTogether.append(riceLong)
        grainsAllTogether.append(riceSteamed)
        grainsAllTogether.append(riceJasmin)
        grainsAllTogether.append(riceRound)
        grainsAllTogether.append(fasolWhite)
        grainsAllTogether.append(fasolRed)
        grainsAllTogether.append(chechevicaGreen)
        grainsAllTogether.append(chechevicaRed)
        grainsAllTogether.append(yachnevayaGrain)
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
    

