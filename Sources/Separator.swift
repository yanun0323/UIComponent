//
//  SwiftUIView.swift
//  
//
//  Created by YanunYang on 2022/7/21.
//

import SwiftUI

@available(iOS 15, macOS 12.0, *)
public enum Direction {
    case horizontal
    case vertical
}

@available(iOS 15, macOS 12.0, *)
public struct Separator: View {
    var direction: Direction = .horizontal
    var color: Color? = nil
    var size: CGFloat? = nil
    
    private var width: CGFloat? {
        direction == .horizontal ? nil : size ?? 1
    }
    
    private var height: CGFloat? {
        direction == .vertical ? nil : size ?? 1
    }
    
    public init(
        direction: Direction = .horizontal,
        color: Color? = nil,
        size: CGFloat? = nil,
    ) {
        self.direction = direction
        self.color = color
        self.size = size
    }
            
    public var body: some View {
        Rectangle()
            .foregroundColor(color ?? .gray)
            .frame(width: width, height: height)
    }
}
