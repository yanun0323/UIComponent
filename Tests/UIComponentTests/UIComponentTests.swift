//
//  File.swift
//  
//
//  Created by YanunYang on 2022/7/30.
//
import XCTest
@testable import UIComponent
import SwiftUI

@available(macOS 12.0, *)
final class UIComponentTests: XCTestCase {
    func testBlock() throws {
        XCTAssertNotNil(Block())
        XCTAssertNotNil(Block(width: 30))
        XCTAssertNotNil(Block(height: 30))
        XCTAssertNotNil(Block(width: 30, height: 30))
    }
    
    func testSeparator() throws {
        XCTAssertNotNil(Separator())
        XCTAssertNotNil(Separator(direction: .horizontal))
        XCTAssertNotNil(Separator(color: .green))
        XCTAssertNotNil(Separator(size: 30))
        XCTAssertNotNil(Separator(direction: .vertical, color: .green, size: 30))
    }
    
    func testButtonCustom() throws {
        XCTAssertNotNil(ButtonCustom(width: 30, height: 30, action: {}, content: {
            Text("Test")
        }))
    }
    
}
