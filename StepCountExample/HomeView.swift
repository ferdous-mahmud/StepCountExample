//
//  ContentView.swift
//  StepCountExample
//
//  Created by Ferdous Mahmud Akash on 3/12/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var hkManager: HealthKitManager
    @State var stepCount = 0.0
    
    var body: some View {
        VStack {
            Text("Your StepCount: \(stepCount)")
        }
        
        Button(action: {
            hkManager.requestForUserPermission()
        }, label: {
            Text("Request for Healthdata")
        })
        
        Button(action: {
            stepCount = hkManager.getTodaysStepCount()
        }, label: {
            Text("Fetch StepCount")
        })
    }
}

#Preview {
    HomeView()
        .environmentObject(HealthKitManager())
}
