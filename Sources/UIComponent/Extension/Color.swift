//
//  File.swift
//  
//
//  Created by YanunYang on 2022/7/21.
//

import SwiftUI

@available(iOS 15, macOS 12.0, *)
extension Color {
    public static let primary: Self = .primary
    public static let secondary: Self = .primary.opacity(0.75)
    public static let gray: Self = .primary.opacity(0.5)
    public static let fade: Self = .primary.opacity(0.25)
    public static let background: Self = ColorAdapter(lightModeColor: .red, darkModeColor: .blue).render
    public static func New(_ lightMode: Self, _ darkMode: Self) -> Self {
        ColorAdapter(lightModeColor: lightMode, darkModeColor: darkMode).render
    }
}

@available(iOS 15, macOS 12.0, *)
struct ColorAdapter {
    @Environment(\.colorScheme) private var colorScheme
    var lightModeColor: Color
    var darkModeColor: Color
    
    public var render: Color {
        switch colorScheme {
        case .light:
            return lightModeColor
        case .dark:
            return darkModeColor
        @unknown default:
            return lightModeColor
        }
    }
}


