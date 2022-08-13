//
//  File.swift
//  
//
//  Created by Yanun on 2022/8/14.
//

import SwiftUI

@available(iOS 15, *)
extension UIApplication {
    public func DismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
