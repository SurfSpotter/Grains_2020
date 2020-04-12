//
//  LocalizationManager.swift
//  Grains
//
//  Created by Алексей Чигарских on 12.04.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import Foundation

extension String {
    func localize() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
