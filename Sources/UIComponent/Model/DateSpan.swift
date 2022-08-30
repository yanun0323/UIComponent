//
//  File.swift
//  
//
//  Created by YanunYang on 2022/8/14.
//


@available(iOS 15, macOS 12.0, *)
public enum DateSpan: Int, Identifiable, Hashable, CaseIterable, Codable {
    public var id: String { self.String() }
    case None=0, Day=1, Week=2, Month=3, Year=4
    
    public func String() -> String {
        switch self {
        case .None:
            return "無"
        case .Day:
            return "日"
        case .Week:
            return "週"
        case .Month:
            return "月"
        case .Year:
            return "年"
        }
    }
    
    public init(_ int: Int) {
        switch int {
        case Self.Day.rawValue:
            self = .Day
        case Self.Week.rawValue:
            self = .Week
        case Self.Month.rawValue:
            self = .Month
        case Self.Year.rawValue:
            self = .Year
        default:
            self = .None
        }
    }
}
