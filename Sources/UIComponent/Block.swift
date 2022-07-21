//
//  SwiftUIView.swift
//  
//
//  Created by YanunYang on 2022/7/21.
//

import SwiftUI

@available(iOS 15, macOS 12.0, *)
struct Block: View {
    var width: CGFloat? = nil
    var height: CGFloat? = nil
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .frame(width: width, height: height)
    }
}
