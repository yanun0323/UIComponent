//
//  File.swift
//  
//
//  Created by YanunYang on 2022/8/11.
//

import Foundation

@available(iOS 15, macOS 12.0, *)
extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal:self).doubleValue
    }
}
