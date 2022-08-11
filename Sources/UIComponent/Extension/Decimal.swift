//
//  File.swift
//  
//
//  Created by YanunYang on 2022/8/11.
//

import Foundation

@available(iOS 15, macOS 12.0, *)
extension Decimal {
    public func ToDouble() -> Double {
        return (self as NSDecimalNumber).doubleValue
    }
    
    public func ToCGFloat() -> CGFloat {
        return CGFloat((self as NSDecimalNumber).floatValue)
    }
    
    public func ToFloat() -> Float {
        return (self as NSDecimalNumber).floatValue
    }
}
