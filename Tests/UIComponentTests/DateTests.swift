import XCTest
@testable import UIComponent

final class DateTests: XCTestCase {
    func testDateParser() throws {
        let result = Date.Parse(date: "2006-01-02 15:04:05 +0800", layout: .Default)
        
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.String(.ANSIC, .US), "Mon Jan 02 15:04:05 2006")
        XCTAssertEqual(result?.String(.ANSIC, .TW), "週一 1月 02 15:04:05 2006")
        XCTAssertEqual(result?.String(.ANSIC, .JP), "月 1月 02 15:04:05 2006")
        
        XCTAssertEqual(result?.String(), "2006-01-02 15:04:05 +0800")
        XCTAssertEqual(result?.String(.ANSIC), "Mon Jan 02 15:04:05 2006")
        XCTAssertEqual(result?.String(.UnixDate), "Mon Jan 02 15:04:05 +0800 2006")
        XCTAssertEqual(result?.String(.RFC822), "02 Jan 06 15:04 +0800")
        XCTAssertEqual(result?.String(.RFC1123), "Mon, 02 Jan 2006 15:04:05 +0800")
        XCTAssertEqual(result?.String(.Stamp), "Jan 02 15:04:05")
        XCTAssertEqual(result?.String(.Date), "2006-01-02")
    }
}
