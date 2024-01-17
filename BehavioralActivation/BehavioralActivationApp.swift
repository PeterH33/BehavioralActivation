//
//  BehavioralActivationApp.swift
//  BehavioralActivation
//
//  Created by Peter Hartnett on 1/16/24.
//
//

import SwiftData
import SwiftUI

@main
struct BehavioralActivationApp: App {
    let modelContainer: ModelContainer
    
    var body: some Scene {
        WindowGroup {
            MainMenuView()
        }
        .modelContainer(modelContainer)
    }
    
    //Unit Testing for SwiftData requires UITesting to be run, this pattern allows us to run the UITests on an in memory store every time
    //Every line dealing with the modelContainer is required for this pattern
    init(){
        var inMemory = false
        
        #if DEBUG
        // This commandLine arg is defined in the setupWithError() of BehavioralActivationUITests.swift
        if CommandLine.arguments.contains("enable-testing"){
            inMemory = true
        }
        #endif
        
        do{
            let configuration = ModelConfiguration(for: Activity.self, isStoredInMemoryOnly: inMemory)
            modelContainer = try ModelContainer(for: Activity.self, configurations: configuration)
        } catch {
            fatalError("💥 Failed to load model Container.")
        }
    }
}
