//
//  SwiftUIView.swift
//  
//
//  Created by YanunYang on 2022/7/21.
//

import SwiftUI

@available(iOS 15, macOS 12.0, *)
public enum Direction {
    public case horizontal
    public case vertical
}

@available(iOS 15, macOS 12.0, *)
public struct UISeparator: View {
    public var direction: Direction = .horizontal
    public var color: Color? = nil
    public var size: CGFloat? = nil
    
    private var width: CGFloat? {
        direction == .horizontal ? nil : size ?? 1
    }
    
    private var height: CGFloat? {
        direction == .vertical ? nil : size ?? 1
    }
            
    public var body: some View {
        Rectangle()
            .foregroundColor(color ?? .gray)
            .frame(width: width, height: height)
    }
}
