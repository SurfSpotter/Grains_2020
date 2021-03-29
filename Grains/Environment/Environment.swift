//
//  Environment.swift
//  Grains
//
//  Created by Алексей Чигарских on 29.03.2021.
//  Copyright © 2021 Алексей Чигарских. All rights reserved.
//

import Foundation

class Environment {
    static var amplitudeApiKey: String {
        return (Bundle.main.infoDictionary?["AMPLITUDE_API_KEY"] as? String)!
    }

    static var amplituProjectId: String {
        return (Bundle.main.infoDictionary?["AMPLITUDE_PROJECT_ID"] as? String)!
    }
}
