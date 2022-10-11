//
//  SwiftUIView.swift
//  
//
//  Created by YanunYang on 2022/10/11.
//

import SwiftUI

public struct Markdown: View {
    @Binding public var text: String
    var body: some View {
        MarkdownView(text: text) { elem in
            ElementView(element: elem)
        }
    }
}
