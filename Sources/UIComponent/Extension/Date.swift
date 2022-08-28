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
    public static func Parse(_ date: String, _ layout: DateFormatLayout) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = layout
        return dateFormatter.date(from: date)
    }
    
    public func IsToday() -> Bool {
        self.String(.Numeric, .US) == Date.now.String(.Numeric, .US)
    }
    
    public func Trunc(_ layout: DateFormatLayout = .Numeric) -> Date? {
        Date.Parse(self.String(layout, .US), layout)
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
    
    public func Add(_ interval: DateSpan) -> Date? {
        switch interval {
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
}


