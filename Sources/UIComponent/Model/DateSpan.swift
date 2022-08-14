//
//  File.swift
//  
//
//  Created by YanunYang on 2022/8/14.
//


@available(iOS 15, macOS 12.0, *)
public enum DateSpan: Identifiable, Hashable, CaseIterable, Codable {
    public var ID: String { self.String() }
    case None, Day, Week, Month, Year
    
    public func String() -> Int {
        switch self {
        case .None:
            return "無"
        case .Day:
            return "天"
        case .Week:
            return "週"
        case .Month:
            return "月"
        case .Year:
            return "年"
        }
    }
}