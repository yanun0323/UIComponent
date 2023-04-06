import SwiftUI

@available(iOS 15, macOS 12.0, *)
public struct SectionCustom<Content>: View where Content: View {
    var title: LocalizedStringKey
    var font: Font = .caption
    var radius: CGFloat = 15
    var bg: Color = .section.opacity(0.5)
    @ViewBuilder var content: () -> Content

    public var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            if title != "" {
                Text(title)
                    .font(font)
                    .foregroundColor(.section)
                    .padding(.leading, 5)
            }
            content()
                .background(bg)
                .cornerRadius(radius)
        }
    }
}

struct SectionCustom_Previews: PreviewProvider {
    static var previews: some View {
        SectionCustom(title: "123") {

        }
    }
}
