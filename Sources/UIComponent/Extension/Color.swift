//
//  File.swift
//  
//
//  Created by YanunYang on 2022/7/21.
//

import SwiftUI

@available(iOS 15, macOS 12.0, *)
extension Color {
    public static let primary100: Self = .primary
    public static let primary75: Self = .primary.opacity(0.75)
    public static let primary50: Self = .primary.opacity(0.5)
    public static let primary25: Self = .primary.opacity(0.25)
    public static var background: Self { ColorAdapter(lightModeColor: .red, darkModeColor: .blue).Render() }
    public static func Dynamic(_ lightMode: Self, _ darkMode: Self) -> Self {
        ColorAdapter(lightModeColor: lightMode, darkModeColor: darkMode).Render()
    }
}

@available(iOS 15, macOS 12.0, *)
public struct ColorAdapter {
    @Environment(\.colorScheme) public var colorScheme
    public var lightModeColor: Color
    public var darkModeColor: Color
    
    public func Render() -> Color {
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


