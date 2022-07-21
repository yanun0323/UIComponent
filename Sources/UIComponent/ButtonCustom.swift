//
//  SwiftUIView.swift
//  
//
//  Created by YanunYang on 2022/7/21.
//

import SwiftUI

@available(iOS 15, macOS 12.0, *)
public enum ButtonStyle {
    case auto
    case blank
    case linked
}


@available(iOS 15, macOS 12.0, *)
public struct ButtonCustom<V>: View where V: View {
    var width: CGFloat
    var height: CGFloat
    var color: Color
    var radius: CGFloat
    var border: CGFloat
    var style: ButtonStyle
    var action: () -> Void
    var content: () -> V
    
    public init(
        width: CGFloat = 55,
        height: CGFloat = 22,
        color: Color = .clear,
        radius: CGFloat = 5,
        border: CGFloat = 1.2,
        style: ButtonStyle = .blank,
        action: @escaping () -> Void,
        content: @escaping () -> V
    ) {
        self.width = width
        self.height = height
        self.color = color
        self.radius = radius
        self.border = border
        self.style = style
        self.action = action
        self.content = content
    }
    
    public var body: some View {
        Button(action: action){
            RoundedRectangle(cornerRadius: radius)
                .foregroundColor(color)
                .frame(width: width, height: height)
                .shadow(radius: border)
                .overlay(content: content)
        }
        .customButtonStyle(style)
    }
}

@available(iOS 15, macOS 12.0, *)
public extension View {
    func customButtonStyle(_ style: ButtonStyle) -> some View {
        switch style {
        case .auto:
            return AnyView(self.buttonStyle(.automatic))
        case .blank:
            return AnyView(self.buttonStyle(.plain))
        case .linked:
            return AnyView(self.buttonStyle(.link))
        }
    }
}
