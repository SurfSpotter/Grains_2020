//
//  AnalyticsManager.swift
//  Grains
//
//  Created by Алексей Чигарских on 29.03.2021.
//  Copyright © 2021 Алексей Чигарских. All rights reserved.
//

import Amplitude
import Foundation

class AnalyticsManager {
    static let shared = AnalyticsManager()

    /// Setup analitics services
    func setUpAmplitude(userId: String?) {
        Amplitude.instance().initializeApiKey(Environment.amplitudeApiKey)
    }

    func logEvent(_ eventName: AnalyticsEvents, _ eventProperties: [String: Any]? = nil) {
        Amplitude.instance().logEvent(eventName.rawValue, withEventProperties: eventProperties)
    }

    func setUserProperties(_ properties: [String: Any]) {
        Amplitude.instance().setUserProperties(properties)
    }

    func updateUserPropertie(name propertie: String, withValue value: Int) {
        let identify = AMPIdentify().add(propertie, value: value as NSObject)
        Amplitude.instance().identify(identify!)
    }
}

enum AnalyticsEvents: String {
    case session_start
    case how_much_smoke_set
    case view_main
    case view_favorites
    case settings_pressed
    case buy_subscription_pressed
    case restore_purchases_pressed
    case view_settings
    case send_feedback_pressed
    case rate_us_pressed
    case view_terms_of_use
    case view_privacy_policy
    case grain_selected
    case timer_selected
}

enum AnalyticsUserProperties: String {
    // Custom User Properties
    case cohort_date
}
