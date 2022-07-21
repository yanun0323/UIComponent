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
    public static func Dynamic(_ lightMode: Self, _ darkMode: Self) -> Self {
        DynamicColor(lightMode, darkMode).Adapter.DisplayColor
    }
}

@available(iOS 15, macOS 12.0, *)
public class DynamicColor: ObservableObject {
    @Published public var Adapter: DynamicColorAdapter
    public init(_ lightMode: Color, _ darkMode: Color) {
        self.Adapter = DynamicColorAdapter(lightMode, darkMode)
    }
}

@available(iOS 15, macOS 12.0, *)
public struct DynamicColorAdapter {
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    private var lightModeColor: Color
    private var darkModeColor: Color
    public init(_ light: Color, _ dark: Color){
        self.lightModeColor = light
        self.darkModeColor = dark
    }
    public var DisplayColor: Color {
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


