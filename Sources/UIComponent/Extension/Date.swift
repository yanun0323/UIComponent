//
//  File.swift
//  
//
//  Created by YanunYang on 2022/7/21.
//

import Foundation
import SwiftUI

@available(iOS 15, macOS 12.0, *)
extension Date {
    public static func Parse(_ date: String, _ layout: DateFormatLayout, _ locale: Locale = Locale.current) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = layout
        dateFormatter.locale = locale
        return dateFormatter.date(from: date)
    }
    
    public func IsToday() -> Bool {
        self.String(.Numeric) == Date.now.String(.Numeric)
    }
    
    public func Trunc(_ layout: DateFormatLayout = .Numeric, _ locale: Locale = .current) -> Date? {
        Date.Parse(self.String(layout, locale), layout)
    }
    
    public func String(_ layout: DateFormatLayout = .Default, _ locale: Locale = .current) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = layout
        dateFormatter.locale = locale
        return dateFormatter.string(from: self)
    }
    
    public func Next() -> Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: self) ?? self
    }
    
    public func Prev() -> Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self) ?? self
    }
    
    public func AddDay(_ day: Int) -> Date {
        return self.Add(.day, day)
    }
    
    public func AddMonth(_ month: Int) -> Date {
        return self.Add(.month, month)
    }
    
    public func AddYear(_ year: Int) -> Date {
        return self.Add(.year, year)
    }
    
    public func AddWeek(_ week: Int) -> Date {
        return self.Add(.day, 7*week)
    }
    
    public func Add(_ unit: Calendar.Component,_  value: Int) -> Date {
        return Calendar.current.date(byAdding: unit, value: value, to: self) ?? self
    }
    
    public func Add(_ span: DateSpan) -> Date? {
        switch span {
        case .None:
            return nil
        case .Day:
            return self.Next()
        case .Week:
            return self.AddWeek(1)
        case .Month:
            return self.AddMonth(1)
        case .Year:
            return self.AddYear(1)
        }
    }
    
    public func DaysBetween(_ date: Date) -> Int {
        return self.distance(to: date).days
    }
    
    public func DaysOfMonth() -> Int {
        guard let first = Self.Parse("\(self.String("yyyyMM"))01", .Numeric) else { return -1 }
        let nextFirst = first.AddMonth(1)
        return first.distance(to: nextFirst).days
    }
    
    public func WeeksOfMonth() -> Int {
        guard let first = Self.Parse("\(self.String("yyyyMM"))01", .Numeric) else { return -1 }
        let firstWeekDay = (first.timeIntervalSince1970.days+5)%7
        let days = first.distance(to: first.AddMonth(1)).days
        return (days+firstWeekDay+6)/7
    }
    
    public func FirstDayOfMonth() -> Date? {
        Self.Parse("\(self.String("yyyyMM", .US))01", .Numeric)
    }
    
    public func WeekDay() -> Int {
        (self.timeIntervalSince1970.days+5)%7
    }
}


