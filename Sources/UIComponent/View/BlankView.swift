//
//  SwiftUIView.swift
//  
//
//  Created by YanunYang on 2022/10/27.
//

import SwiftUI

@available(iOS 15, macOS 12.0, *)
public struct BlankView: View {
    
    public init() {}
    
    public var body: some View {
        Rectangle()
            .foregroundColor(.transparent)
    }
}

struct BlankView_Previews: PreviewProvider {
    static var previews: some View {
        BlankView()
    }
}
