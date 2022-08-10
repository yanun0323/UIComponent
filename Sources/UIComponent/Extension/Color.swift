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
    public static func Dynamic(_ colorScheme: ColorScheme, _ lightModeColor: Self, _ darkModeColor: Self) -> Self {
        if colorScheme == .dark {
            return darkModeColor
        }
        return lightModeColor
    }
}

