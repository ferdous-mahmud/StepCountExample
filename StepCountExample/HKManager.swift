//
//  HKManager.swift
//  StepCountExample
//
//  Created by Ferdous Mahmud Akash on 3/12/24.
//

import HealthKitUI

class HealthKitManager: ObservableObject {
    private let healthStore = HKHealthStore()
    private let readHealthDataTypes: Set = [
        HKQuantityType(.stepCount),
    ]
    
    private let writeHealthDataTypes: Set = [
        HKQuantityType(.stepCount)
    ]
    
    func requestForUserPermission() {
        Task {
            do {
                try await healthStore.requestAuthorization(toShare: writeHealthDataTypes,read: readHealthDataTypes)
            } catch {
                debugPrint("error while requesting healthKit data")
            }
        }
    }
    
    func getTodaysStepCount() -> Double {
        var stepCount = 0.0
        let steps = HKQuantityType(.stepCount)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        let query = HKStatisticsQuery(quantityType: steps, quantitySamplePredicate: predicate) { _, result, error in
            
            guard let quantity = result?.sumQuantity(), error == nil else {
                debugPrint("Error while fetching todays step! Error: \(error?.localizedDescription ?? "No error description available")")
                return
            }
           stepCount = quantity.doubleValue(for: .count())
           debugPrint("Todays Step Count: \(stepCount)")
        }
        healthStore.execute(query)
        return stepCount
    }
}

