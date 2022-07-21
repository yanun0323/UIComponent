//
//  SwiftUIView.swift
//  
//
//  Created by YanunYang on 2022/7/21.
//

import SwiftUI

@available(iOS 15, macOS 12.0, *)
public struct Block: View {
    public var width: CGFloat? = nil
    public var height: CGFloat? = nil
    public var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .frame(width: width, height: height)
    }
}
