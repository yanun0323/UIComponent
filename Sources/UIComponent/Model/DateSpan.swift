//
//  File.swift
//  
//
//  Created by YanunYang on 2022/8/14.
//


@available(iOS 15, macOS 12.0, *)
public enum DateSpan: Identifiable, Hashable, CaseIterable, Codable {
    var ID: Int { self.Int() }
    case None, Day, Week, Month, Year
    
    public func Int() -> Int {
        switch self {
        case .None:
            return 0
        case .Day:
            return 1
        case .Week:
            return 2
        case .Month:
            return 3
        case .Year:
            return 4
        }
    }
}
