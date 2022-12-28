import SwiftUI

@available(iOS 15, macOS 12.0, *)
public struct ToggleCustom: View {
    @Binding var isOn: Bool
    @Binding var color: Color
    var size: CGFloat = 26
    var ratio: CGFloat = 1.7
    let gap: CGFloat = 2
    
    init(isOn: Binding<Bool>, color: Binding<Color>, size: CGFloat, ratio: CGFloat) {
        self._isOn = .init(projectedValue: isOn)
        self._color = .init(projectedValue: color)
        self.size = size
        self.ratio = ratio
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
