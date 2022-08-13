//
//  SwiftUIView.swift
//  
//
//  Created by Yanun on 2022/8/14.
//

import SwiftUI

// MARK: Controller
@available(iOS 15, macOS 12.0, *)
public class HalfSheetController<Content>: UIHostingController<Content> where Content : View {
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let presentation = sheetPresentationController {
            presentation.detents = [.medium(), .large()]
            presentation.prefersGrabberVisible = false
            presentation.largestUndimmedDetentIdentifier = .medium
        }
    }
}

// MARK: Structure
@available(iOS 15, macOS 12.0, *)
public struct HalfSheet<Content>: UIViewControllerRepresentable where Content : View {
    
    public let content: Content
    
    @inlinable init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    public func makeUIViewController(context: Context) -> HalfSheetController<Content> {
        return HalfSheetController(rootView: content)
    }
    
    public func updateUIViewController(_: HalfSheetController<Content>, context: Context) {
    }
}
