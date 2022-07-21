//
//  SwiftUIView.swift
//  
//
//  Created by YanunYang on 2022/7/21.
//

import SwiftUI

@available(iOS 15, macOS 12.0, *)
public enum ButtonStyle {
    public case auto
    public case blank
    public case linked
}


@available(iOS 15, macOS 12.0, *)
public struct UIButtonCustom<V>: View where V: View {
    public var width: CGFloat = 55
    public var height: CGFloat = 22
    public var color: Color = .clear
    public var radius: CGFloat = 5
    public var border: CGFloat = 1.2
    public var style: ButtonStyle = .blank
    public var action: () -> Void
    public var content: () -> V
    
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
    public func customButtonStyle(_ style: ButtonStyle) -> some View {
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
