//
//  SwiftUIView.swift
//  
//
//  Created by Yanun on 2022/8/14.
//

import SwiftUI

import SwiftUI

// MARK: Controller
class HalfSheetController<Content>: UIHostingController<Content> where Content : View {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let presentation = sheetPresentationController {
            presentation.detents = [.medium(), .large()]
            presentation.prefersGrabberVisible = false
            presentation.largestUndimmedDetentIdentifier = .medium
        }
    }
}

// MARK: Structure
public struct HalfSheet<Content>: UIViewControllerRepresentable where Content : View {
    
    private let content: Content
    
    @inlinable init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    func makeUIViewController(context: Context) -> HalfSheetController<Content> {
        return HalfSheetController(rootView: content)
    }
    
    func updateUIViewController(_: HalfSheetController<Content>, context: Context) {
    }
}
