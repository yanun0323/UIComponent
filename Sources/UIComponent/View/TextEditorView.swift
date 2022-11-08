import SwiftUI

public struct TextEditorView: View {
    @FocusState private var focus: Bool
    @Binding private var text: String
    @State private var data: String
    
    public init(text: Binding<String>) {
        self._text = text
        self.data = text.wrappedValue
    }
    
    public var body: some View {
        TextEditor(text: $data)
            .focused($focus)
            .disabled(!focus)
            .onChange(of: data) { value in
                text = data
            }
            .onAppear {
                focus = true
            }
            .onDisappear {
                focus = false
            }
    }
}

struct TextEditorView_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorView(text: .constant("Hello"))
            .preferredColorScheme(.dark)
    }
}
