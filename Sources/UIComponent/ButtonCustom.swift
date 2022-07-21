//
//  SwiftUIView.swift
//  
//
//  Created by YanunYang on 2022/7/21.
//

import SwiftUI

@available(iOS 15, macOS 12.0, *)
enum ButtonStyle {
    case auto
    case blank
    case linked
}


@available(iOS 15, macOS 12.0, *)
struct ButtonCustom<V>: View where V: View {
    var width: CGFloat = 55
    var height: CGFloat = 22
    var color: Color = .clear
    var radius: CGFloat = 5
    var border: CGFloat = 1.2
    var style: ButtonStyle = .blank
    var action: () -> Void
    var content: () -> V
    
    var body: some View {
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
extension View {
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
