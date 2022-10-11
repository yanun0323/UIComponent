import SwiftUI

public struct Line: View {
    let element: LineElement
    
    public init(element: LineElement) {
        self.element = element
    }
    
    public var body: some View {
        Text(try! AttributedString(markdown: element.text))
    }
}
