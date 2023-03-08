import Foundation
import SwiftUI

// MARK: Static function
@available(iOS 15, macOS 12.0, *)
extension Date {
    public init?(from date: String, _ layout: DateFormatLayout, _ locale: Locale = Locale.current) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = layout
        dateFormatter.locale = locale
        dateFormatter.timeZone = .autoupdatingCurrent
        guard let result = dateFormatter.date(from: date) else { return nil }
        self = result
    }

    public init(_ unixDay: Int) {
        self = Date(timeIntervalSince1970: TimeInterval(unixDay * 86400))
    }
}

// MARK: Property
@available(iOS 15, macOS 12.0, *)
extension Date {
    /** Return the second for 1970-01-01 00:00:00 UTC*/
    public var unix: Int {
        self.timeIntervalSince1970.seconds
    }

    /** Return the day for 1970-01-01 UTC*/
    public var unixDay: Int {
        self.timeIntervalSince1970.days
    }

    /** Return the day of the week

     0 = Sunday, 1 = Monday, ... 6 = Saturday
     */
    public var dayOfWeekDay: Int {
        (self.unixDay + 5) % 7
    }

    public var isToday: Bool {
        self.unixDay == Date.now.unixDay
    }

    public var daysOfMonth: Int {
        let first = self.firstDayOfMonth
        return first.distance(to: first.AddMonth(1)).days
    }

    public var weeksOfMonth: Int {
        guard let first = Self.init(from: "\(self.String("yyyyMM"))01", .Numeric) else { return -1 }
        let firstWeekDay = (first.timeIntervalSince1970.days + 5) % 7
        let days = first.distance(to: first.AddMonth(1)).days
        return (days + firstWeekDay + 6) / 7
    }

    public var firstDayOfMonth: Date {
        Self.init(from: "\(self.String("yyyyMM", .US))01", .Numeric)!
    }

    public var lastDayOfMonth: Date {
        self.firstDayOfMonth.AddMonth(1).AddDay(-1)
    }
}

// MARK: Function
@available(iOS 15, macOS 12.0, *)
extension Date {
    public func String(_ layout: DateFormatLayout = .Default, _ locale: Locale = .current) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = layout
        dateFormatter.locale = locale
        dateFormatter.timeZone = .autoupdatingCurrent
        return dateFormatter.string(from: self)
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
        return self.Add(.day, 7 * week)
    }

    public func Add(_ unit: Calendar.Component, _ value: Int) -> Date {
        return Calendar.current.date(byAdding: unit, value: value, to: self) ?? self
    }

    public func Add(_ span: DateSpan) -> Date? {
        switch span {
        case .None:
            return nil
        case .Day:
            return self.AddDay(1)
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
}
