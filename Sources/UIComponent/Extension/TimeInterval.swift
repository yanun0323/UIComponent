//
//  File.swift
//  
//
//  Created by YanunYang on 2022/9/5.
//

import Foundation

extension TimeInterval {

    var seconds: Int {
        return Int(self.rounded())
    }
    
    var days: Int {
        return self.seconds/(60*60*24)
    }

    var milliseconds: Int {
        return Int(self * 1_000)
    }
}
