import SwiftUI

@available(iOS 15, macOS 12.0, *)
extension View {
    public func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content
    ) -> some View {
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }

    @ViewBuilder
    public func section(_ title: String = "", font: Font = .title3) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            if title.count != 0 {
                Text(title)
                    .font(font)
                    .foregroundColor(.primary50)
                    .padding(.leading, 5)
            }
            self
                .background(Color.section.opacity(0.5))
                .cornerRadius(7)
        }
    }
}

@available(iOS 15, macOS 12.0, *)
extension View {
    public func inject<T>(_ object: T) -> some View where T: ObservableObject {
        self.environmentObject(object)
    }
}
