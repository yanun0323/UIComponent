//
//  File.swift
//  
//
//  Created by YanunYang on 2022/7/21.
//

import SwiftUI

extension Color {
    static let extend = ColorCustom
}

private struct ColorCustom {
    let primary = Color.primary
    let secondary = Color.primary.opacity(0.75)
    let gray = Color.primary.opacity(0.5)
    let fade = Color.primary.opacity(0.25)
    let background = Color.background
}
