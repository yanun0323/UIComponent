import SwiftUI


@available(macOS 12.0, iOS 15, *)
public struct System {
    public static let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "-"
    public static let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "-"
}

#if os(macOS)
import AppKit

@available(macOS 12.0, *)
extension System {
    public static func Unfocus() {
        NSApp.keyWindow?.makeFirstResponder(nil)
    }
}
#endif



#if os(iOS)
import UIKit

@available(iOS 15, *)
extension System {
    public static let device: Device = .init()
}

public struct Device {
    public let screen: CGRect = UIScreen.main.bounds
}
#endif
