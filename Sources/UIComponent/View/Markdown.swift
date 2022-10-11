//
//  SwiftUIView.swift
//  
//
//  Created by YanunYang on 2022/10/11.
//

import SwiftUI

public struct Markdown: View {
    @Binding public var text: String
    public var body: some View {
        MarkdownComponent(text: text) { elem in
            ElementView(element: elem)
        }
    }
}
