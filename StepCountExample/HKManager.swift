//
//  HKManager.swift
//  StepCountExample
//
//  Created by Ferdous Mahmud Akash on 3/12/24.
//

import HealthKitUI

class HealthKitManager: ObservableObject {
    private let healthStore = HKHealthStore()
    
    func requestForUserPermission() {
        let readHealthDataTypes: Set = [
            HKQuantityType(.stepCount),
        ]
        
        let writeHealthDataTypes: Set = [
            HKQuantityType(.stepCount)
        ]
        
        Task {
            do {
                try await healthStore.requestAuthorization(toShare: writeHealthDataTypes,read: readHealthDataTypes)
            } catch {
                debugPrint("error while requesting healthKit data")
            }
        }
    }
}
