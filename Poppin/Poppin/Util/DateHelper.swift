//
//  DateHelper.swift
//  Poppin
//
//  Created by Blake Swaidner on 12/9/18.
//  Copyright © 2018 MoBamba. All rights reserved.
//

import Foundation

extension Date {
    
    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
    
    func dayOfWeek() -> Int {
        return Calendar.current.component(.weekday, from: self)
    }
    
    func day() -> Int {
        return Calendar.current.component(.day, from: self)
    }
    
    func hour() -> Int {
        return Calendar.current.component(.hour, from: self)
    }
    
    func minutes() -> Int {
        return Calendar.current.component(.minute, from: self)
    }
    
    func seconds() -> Int {
        return Calendar.current.component(.second, from: self)
    }
    
    
    func timeUntilDate(date: Date) -> DateComponents {
        guard   let start = self.convertToCurrentDate(),
                let end = date.convertToCurrentDate()
                else { return DateComponents() }
        return Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: start, to: end)
    }
    
    func isBetweenDates(startDate: Date, endDate: Date) -> Bool {
        guard   let start = startDate.convertToCurrentDate(),
                let end = endDate.convertToCurrentDate(),
                let now = Date().convertToCurrentDate()
                else { return false }
        return start.compare(now) == now.compare(end)
    }
    
    func convertToCurrentDate() -> Date? {
        // TODO: blake- Figure out future solution for UTC offset
        let calendar = Calendar.current
        let currentDate = calendar.dateComponents([.day, .month, .year], from: Date().addingTimeInterval(-18000))
        var startComponents = calendar.dateComponents([.hour, .minute, .second], from: self.addingTimeInterval(-18000))
        startComponents.setValue(currentDate.day ?? 0, for: .day)
        startComponents.setValue(currentDate.month ?? 0, for: .month)
        startComponents.setValue(currentDate.year ?? 0, for: .year)
        
        return calendar.date(from: startComponents)?.addingTimeInterval(-18000)
    }
    
}
