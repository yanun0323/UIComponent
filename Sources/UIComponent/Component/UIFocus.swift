//
//  SwiftUIView.swift
//  
//
//  Created by YanunYang on 2022/7/21.
//

import SwiftUI

@available(iOS 15, macOS 12.0, *)
public struct UIFocus: View {
    @FocusState private var focus: Bool
    @State private var textField: String = ""
    var body: some View {
        TextField(text: $textField) {}
            .frame(width:1, height: 1)
            .opacity(0)
            .focused($focus)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.focus = true
            }
        }
    }
}
