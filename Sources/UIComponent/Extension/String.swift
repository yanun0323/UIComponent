//
//  File.swift
//  
//
//  Created by YanunYang on 2022/7/21.
//

import Foundation

extension String {
    public var IsNumber: Bool {
        if self.isEmpty { return false }
        return self == self.filter { $0.isNumber }
    }
}
