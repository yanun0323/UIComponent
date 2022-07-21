//
//  File.swift
//  
//
//  Created by YanunYang on 2022/7/21.
//

import SwiftUI

@available(iOS 15, macOS 12.0, *)
extension Color {
    static let extend = ColorCustom()
}

@available(iOS 15, macOS 12.0, *)
private struct ColorCustom {
    let primary = Color.primary
    let secondary = Color.primary.opacity(0.75)
    let gray = Color.primary.opacity(0.5)
    let fade = Color.primary.opacity(0.25)
    let background = Color.background
}
