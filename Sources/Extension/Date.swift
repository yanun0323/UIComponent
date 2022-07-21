//
//  File.swift
//  
//
//  Created by YanunYang on 2022/7/21.
//

import Foundation
import SwiftUI

extension Date {
    public static func Parse(date: String, layout: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = layout
        return dateFormatter.date(from: date)
    }
    
    
    public static let Layout = DateFormatLayout()
    
    public func String(format: String = "YYYY/MM/dd") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "zh_Hant_TW")
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

public struct DateFormatLayout {
    // "Wed Jan 02 15:04:05 2006"
    public let ANSIC = "EE MMM dd HH:mm:ss yyyy"
    // "Wed Jan 02 15:04:05 -0700 2006"
    public let UnixDate = "EE MMM dd HH:mm:ss Z yyyy"
    // "02 Jan 2006 15:04 -0700"
    public let RFC822 = "dd MMM yy HH:mm Z"
    // "Wed, 02 Jan 2006 15:04:05 -0700"
    public let RFC1123 = "EE, dd MMM yyyy HH:mm:ss Z"
    // "Jan 02 2006 15:04:05"
    public let Stamp = "MMM dd HH:mm:ss"
    // "2006-01-02"
    public let Date = "yyyy-MM-dd"
}
