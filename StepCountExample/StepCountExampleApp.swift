//
//  StepCountExampleApp.swift
//  StepCountExample
//
//  Created by Ferdous Mahmud Akash on 3/12/24.
//

import SwiftUI

@main
struct StepCountExampleApp: App {
    @StateObject var hkManager = HealthKitManager()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(hkManager)
        }
    }
}
