//
//  SwiftUIView.swift
//  
//
//  Created by YanunYang on 2022/7/21.
//

import SwiftUI

@available(iOS 15, macOS 12.0, *)
public struct Block: View {
    var width: CGFloat?
    var height: CGFloat?
    
    public init(width: CGFloat? = nil, height: CGFloat? = nil) {
        self.width = width
        self.height = height
    }
    
    public var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .frame(width: width, height: height)
    }
}
