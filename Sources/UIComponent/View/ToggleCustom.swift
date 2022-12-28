import SwiftUI

@available(iOS 15, macOS 12.0, *)
public struct ToggleCustom: View {
    @Binding var isOn: Bool
    @Binding var color: Color
    var size: CGFloat
    var ratio: CGFloat
    var gap: CGFloat
    
    init(
        isOn: Binding<Bool>,
        color: Binding<Color>,
        size: CGFloat = 26,
        ratio: CGFloat = 1.7,
        gap: CGFloat = 2
    ) {
        self._isOn = .init(projectedValue: isOn)
        self._color = .init(projectedValue: color)
        self.size = size
        self.ratio = ratio
        self.gap = gap
    }
    
    public var body: some View {
        HStack(spacing: 0) {
            if isOn {
                Spacer()
            }
            Circle()
                .foregroundColor(.white)
                .frame(width: size, height: size)
                .shadow(color: .section, radius: 3)
            if !isOn {
                Spacer()
            }
        }
        .frame(width: size*ratio, height: size)
        .padding(gap)
        .background(isOn ? color : Color.section)
        .clipShape(Capsule())
        .onTapGesture {
            withAnimation {
                isOn.toggle()
            }
        }
    }
}
