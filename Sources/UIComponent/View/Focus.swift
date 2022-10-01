import SwiftUI

@available(iOS 15, macOS 12.0, *)
public struct Focus: View {
    @FocusState private var focus: Bool
    @State private var textField: String = ""
    
    public init() {}
    
    public var body: some View {
        TextField(text: $textField) {}
            .frame(width:1, height: 1)
            .opacity(0)
            .focused($focus)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.focus = true
            }
        }
    }
}
