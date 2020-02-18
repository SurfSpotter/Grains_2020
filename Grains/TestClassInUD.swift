//
//  TestClassInUD.swift
//  Grains
//
//  Created by Алексей Чигарских on 16.02.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import Foundation


class EasyClass: NSCoder {
    var testName: String?
    var testInt: Int?
    
    
    init (testNameInit: String?, testIntInit: Int?) {
        self.testName = testNameInit
        self.testInt = testIntInit
    }
    
    required convenience init (coder aDecoder: NSCoder) {
        let testInt = aDecoder.decodeInteger(forKey: "testInt")
        let testName = aDecoder.decodeObject(forKey: "testName") as! String
        self.init(testNameInit: testName, testIntInit: testInt)
        
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(testName, forKey: "testName")
        aCoder.encode(testInt, forKey: "testInt")
    }
    
    
    
    
}
 
var aaaa = EasyClass(testNameInit: "Alex", testIntInit: 32)



