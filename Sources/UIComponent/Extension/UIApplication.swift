import SwiftUI

#if os(iOS)
@available(iOS 15, *)
extension UIApplication {
    public func DismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
