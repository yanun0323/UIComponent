import SwiftUI

@available(iOS 15, macOS 12.0, *)
public struct Block: View {
    var width: CGFloat?
    var height: CGFloat?
    var color: Color
    
    public init(width: CGFloat? = nil, height: CGFloat? = nil, color: Color = .clear) {
        self.width = width
        self.height = height
        self.color = color
    }
    
    public var body: some View {
        Rectangle()
            .foregroundColor(color)
            .frame(width: width, height: height)
    }
}
