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
    public static func Parse(date: String, layout: DateFormatLayout) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = layout
        return dateFormatter.date(from: date)
    }
    
    public func IsToday() -> Bool {
        self.String(.Numeric, .US) == Date.now.String(.Numeric, .US)
    }
    
    public func Trunc(_ layout: DateFormatLayout = .Numeric) -> Date? {
        Date.Parse(date: self.String(layout, .US), layout: layout)
    }
    
    public func String(_ layout: DateFormatLayout = .Default, _ locale: DateLocale = .US) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = layout
        dateFormatter.locale = Locale(identifier: locale)
        return dateFormatter.string(from: self)
    }
    
    public func Next() -> Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: self) ?? self
    }
    
    public func Prev() -> Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self) ?? self
    }
    
    public func AddDay(day: Int) -> Date {
        return self.Add(unit: .day, value: 1)
    }
    
    public func AddMonth(month: Int) -> Date {
        return self.Add(unit: .month, value: 1)
    }
    
    public func AddYear(year: Int) -> Date {
        return self.Add(unit: .year, value: 1)
    }
    
    public func AddWeek(week: Int) -> Date {
        return self.Add(unit: .day, value: 7)
    }
    
    public func Add(unit: Calendar.Component, value: Int) -> Date {
        return Calendar.current.date(byAdding: unit, value: value, to: self) ?? self
    }
}

