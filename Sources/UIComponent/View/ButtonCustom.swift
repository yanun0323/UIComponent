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
    var shadow: CGFloat
    var action: () -> Void
    var content: () -> V
    
    public init(
        width: CGFloat,
        height: CGFloat,
        color: Color = .clear,
        radius: CGFloat = 0,
        shadow: CGFloat = 0,
        action: @escaping () -> Void,
        content: @escaping () -> V
    ) {
        self.width = width
        self.height = height
        self.color = color
        self.radius = radius
        self.shadow = shadow
        self.action = action
        self.content = content
    }
    
    public var body: some View {
        Button(action: action){
            if shadow == 0 {
                RoundedRectangle(cornerRadius: radius)
                    .foregroundColor(color)
                    .frame(width: width, height: height)
                    .overlay(content: content)
            } else {
                RoundedRectangle(cornerRadius: radius)
                    .shadow(radius: shadow)
                    .foregroundColor(color)
                    .frame(width: width > 0 ? width: .zero, height: height > 0 ? height : .zero)
                    .overlay(content: content)
            }
        }
        .buttonStyle(.plain)
    }
}
