//
//  File.swift
//  
//
//  Created by YanunYang on 2022/8/11.
//

#if os(iOS)
import UIKit
#elseif os(watchOS)
import WatchKit
#elseif os(macOS)
import AppKit
#endif

import SwiftUI

@available(iOS 15, macOS 12.0, *)
class CodableColor: Codable {
    var R: CGFloat
    var G: CGFloat
    var B: CGFloat
    var A: CGFloat
    
    init(_ color: Color) {
        R = 0
        G = 0
        B = 0
        A = 0
        #if os(macOS)
        typealias SystemColor = NSColor
        #else
        typealias SystemColor = UIColor
        #endif
        SystemColor(color).getRed(&R, green: &G, blue: &B, alpha: &A)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        R = try container.decode(Double.self, forKey: .red)
        G = try container.decode(Double.self, forKey: .green)
        B = try container.decode(Double.self, forKey: .blue)
        A = try container.decode(Double.self, forKey: .alpha)
    }
}

// MARK: Codable
@available(iOS 15, macOS 12.0, *)
extension CodableColor {
    
    enum CodingKeys: String, CodingKey {
        case red, green, blue, alpha
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(R, forKey: .red)
        try container.encode(G, forKey: .green)
        try container.encode(B, forKey: .blue)
        try container.encode(A, forKey: .alpha)
    }
    
}

// MARK: Method
@available(iOS 15, macOS 12.0, *)
extension CodableColor {
    
    func GetColor() -> Color {
        Color.init(.sRGB, red: R, green: G, blue: B, opacity: A)
    }
    
}

