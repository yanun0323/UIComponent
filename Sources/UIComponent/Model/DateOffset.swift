//
//  File.swift
//  
//
//  Created by YanunYang on 2022/8/14.
//


@available(iOS 15, macOS 12.0, *)
public enum DateOffset: Hashable, Codable {
    case Day, Week, Month, Year
    
    public func Date(_ date: Date) -> Date {
        switch self {
        case .Day:
            return date.Next()
        case .Week:
            return date.AddWeek(week: 1)
        case .Month:
            return date.AddMonth(month: 1)
        case .Year:
            return date.AddYear(year: 1)
        }
    }
}
