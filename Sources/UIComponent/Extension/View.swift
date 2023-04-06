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
    public func section(
        _ title: String = "", font: Font = .title3, radius: CGFloat = 15,
        bg: Color = .section.opacity(0.5)
    ) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            if title.count != 0 {
                Text(title)
                    .font(font)
                    .foregroundColor(.section)
                    .padding(.leading, 5)
            }
            HStack {
                Spacer()
                self
                Spacer()
            }
            .background(bg)
            .cornerRadius(radius)
        }
    }
}

@available(iOS 15, macOS 12.0, *)
extension View {
    public func inject<T>(_ object: T) -> some View where T: ObservableObject {
        self.environmentObject(object)
    }
}
