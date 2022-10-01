import Foundation

#if os(iOS)
import UIKit
@available(iOS 15, *)
public class Device {
    public static let screen: CGRect = UIScreen.main.bounds
}
#endif
