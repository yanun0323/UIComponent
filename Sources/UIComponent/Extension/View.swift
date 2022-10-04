import SwiftUI

@available(iOS 15, macOS 12.0, *)
extension View {
    public func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View
    {
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

@available(iOS 15, macOS 12.0, *)
extension View {
    public func inject<T>(_ object: T) -> some View where T: ObservableObject {
        self.environmentObject(object)
    }
}
