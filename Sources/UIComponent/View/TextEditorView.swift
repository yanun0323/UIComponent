import SwiftUI

struct TextEditorView: View {
    @Binding private var text: String
    @State private var data: String
    
    init(text: Binding<String>) {
        self._text = text
        self.data = text.wrappedValue
    }
    
    var body: some View {
        TextEditor(text: $data)
            .onChange(of: data) { value in
                print("data change")
                text = data
            }
    }
}

struct TextEditorView_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorView(text: .constant("Hello"))
            .preferredColorScheme(.dark)
    }
}
