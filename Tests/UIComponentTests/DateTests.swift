import XCTest
@testable import UIComponent

@available(iOS 15, macOS 12.0, *)
final class DateTests: XCTestCase {
    func testDateParser() throws {
        let result = Date.init(from: "2006-01-02 15:04:05 +0800", .Default)
        
        
        XCTAssertNotNil(result)
        
        XCTAssertEqual(result?.String(.Default, .US), "2006-01-02 15:04:05 +0800")
        XCTAssertEqual(result?.String(.ANSIC, .US), "Mon Jan 02 15:04:05 2006")
        XCTAssertEqual(result?.String(.UnixDate, .US), "Mon Jan 02 15:04:05 +0800 2006")
        XCTAssertEqual(result?.String(.RFC822, .US), "02 Jan 06 15:04 +0800")
        XCTAssertEqual(result?.String(.RFC1123, .US), "Mon, 02 Jan 2006 15:04:05 +0800")
        XCTAssertEqual(result?.String(.Stamp, .US), "Jan 02 15:04:05")
        XCTAssertEqual(result?.String(.Date, .US), "2006-01-02")
    }
    
    func testDayBetween() throws {
        let A = Date(from: "2006-01-01", .Date)!
        let B = Date(from: "2006-01-10", .Date)!
        XCTAssertEqual(A.DaysBetween(B), 9)
    }
    
    func testDayCount() throws {
        let A = Date(from: "2006-01-31", .Date)!
        let B = Date(from: "2006-09-15", .Date)!
        let C = Date(from: "2006-03-15", .Date)!
        XCTAssertEqual(A.daysOfMonth, 31)
        XCTAssertEqual(B.daysOfMonth, 30)
        XCTAssertEqual(C.daysOfMonth, 31)
    }
    
    func testWeekDay() throws {
        let date = Date(from: "2022-09-11", .Date)!
        XCTAssertEqual(date.dayOfWeekDay, 0)
    }
}
