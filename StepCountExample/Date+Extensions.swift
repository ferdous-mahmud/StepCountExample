//
//  Date+Extensions.swift
//  StepCountExample
//
//  Created by Ferdous Mahmud Akash on 3/12/24.
//

import Foundation

extension Date {
    static var startOfDay: Date {
        Calendar.current.startOfDay(for: Date())
    }
}
