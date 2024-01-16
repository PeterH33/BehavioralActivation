//
//  BehavioralActivationApp.swift
//  BehavioralActivation
//
//  Created by Peter Hartnett on 1/16/24.
//

import SwiftData
import SwiftUI

@main
struct BehavioralActivationApp: App {
    var body: some Scene {
        WindowGroup {
            MainMenuView()
        }
        .modelContainer(for: Activity.self)
    }
}
