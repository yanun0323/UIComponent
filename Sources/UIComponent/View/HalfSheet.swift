//
//  SwiftUIView.swift
//  
//
//  Created by Yanun on 2022/8/14.
//

import SwiftUI
#if os(iOS)
// MARK: Controller
@available(iOS 15, *)
public class HalfSheetController<Content>: UIHostingController<Content> where Content : View {
    public var grabber: Bool = true
    public var radius: CGFloat = 15
    
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let presentation = sheetPresentationController {
            presentation.detents = [.medium(), .large()]
            presentation.prefersGrabberVisible = grabber
            presentation.largestUndimmedDetentIdentifier = .medium
            presentation.preferredCornerRadius = radius
        }
    }
    
    public func Inject(_ grabberVisible: Bool, _ cornerRadius: CGFloat) -> Self {
        self.grabber = grabberVisible
        self.radius = cornerRadius
        return self
    }
}

// MARK: Structure
@available(iOS 15, *)
@available(macOS, unavailable)
public struct HalfSheet<Content>: UIViewControllerRepresentable where Content : View {
    
    public let grabber: Bool
    public let radius: CGFloat
    public let content: Content
    
    public init(grabber: Bool = true, radius: CGFloat = 15, @ViewBuilder content: () -> Content) {
        self.grabber = grabber
        self.radius = radius
        self.content = content()
    }
    
    public func makeUIViewController(context: Context) -> HalfSheetController<Content> {
        return HalfSheetController(rootView: content).Inject(grabber, radius)
    }
    
    public func updateUIViewController(_: HalfSheetController<Content>, context: Context) {
    }
}
#endif
