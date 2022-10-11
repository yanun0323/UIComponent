import SwiftUI
import WebKit

#if os(OSX)
    import AppKit
    public typealias ViewRepresentable = NSViewRepresentable
public typealias CustomView = NSView
#elseif os(iOS)
    import UIKit
    public typealias ViewRepresentable = UIViewRepresentable
public typealias CustomView = UIView
#endif

// MARK: View
public struct Markdown: View {
    @Environment(\.colorScheme) var colorScheme
    @State var text: String = ""
    @State var theme: ColorScheme?
    
    public init(_ text: String) {
        self.text = text
        self.theme = colorScheme
    }
    public init(_ text: String, _ theme: ColorScheme?) {
        self.text = text
        self.theme = theme
    }
    
    public var body: some View {
        MarkdownComponent(content: $text, theme: theme)
    }
}

public struct MarkdownComponent: ViewRepresentable {
    
    @Binding var content: String
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.markdownStyle) private var style: MarkdownStyle
    var textDidChanged: ((String) -> Void)?
    var theme: ColorScheme?

    public init(content: Binding<String>) {
        self._content = content
        self.theme = colorScheme
    }
    public init(content: Binding<String>, theme: ColorScheme?) {
        self._content = content
        self.theme = theme
    }
    
    public func makeCoordinator() -> Coordinator {
        return Coordinator(content: $content, colorScheme: colorScheme)
    }
    private func getWebView(context: Context) -> MarkdownWebView {
        let codeView = MarkdownWebView()
        codeView.setContent(content)
        if (style.padding != nil) {
            codeView.setPadding(style.padding!)
        }
        if (style.paddingTop != nil) {
            codeView.setPaddingTop(style.paddingTop!)
        }
        if (style.paddingBottom != nil) {
            codeView.setPaddingBottom(style.paddingBottom!)
        }
        if (style.paddingLeft != nil) {
            codeView.setPaddingLeft(style.paddingLeft!)
        }
        if (style.paddingRight != nil) {
            codeView.setPaddingRight(style.paddingRight!)
        }
        codeView.textDidChanged = { text in
            context.coordinator.set(content: text)
        }
        colorScheme == .dark ? codeView.setTheme(.dark) : codeView.setTheme(.light)
        return codeView
    }
    
    private func updateView(_ webview: MarkdownWebView, context: Context) {
        if context.coordinator.colorScheme != colorScheme {
            colorScheme == .dark ? webview.setTheme(.dark) : webview.setTheme(.light)
            context.coordinator.set(colorScheme: colorScheme)
        }
        if context.coordinator.content != content {
            webview.setContent(content)
        }
    }
    // MARK: macOS
    public func makeNSView(context: Context) -> MarkdownWebView {
        return getWebView(context: context)
    }
    
    public func updateNSView(_ webview: MarkdownWebView, context: Context) {
        updateView(webview, context: context)
    }
    // MARK: iOS
    public func makeUIView(context: Context) -> MarkdownWebView {
        getWebView(context: context)
    }
    
    public func updateUIView(_ webview: MarkdownWebView, context: Context) {
        updateView(webview, context: context)
    }
    
}

extension View {
    public func markdownStyle(_ markdownStyle: MarkdownStyle) -> some View {
      return environment(\.markdownStyle, markdownStyle)
    }
}

public extension MarkdownComponent {
    class Coordinator: NSObject {
        @Binding private(set) var content: String
        private(set) var colorScheme: ColorScheme
        
        init(content: Binding<String>, colorScheme: ColorScheme) {
            _content = content
            self.colorScheme = colorScheme
        }
        
        func set(content: String) {
            if self.content != content {
                self.content = content
            }
        }
        
        func set(colorScheme: ColorScheme) {
            if self.colorScheme != colorScheme {
                self.colorScheme = colorScheme
            }
        }
    }
}

extension EnvironmentValues {
  fileprivate var markdownStyle: MarkdownStyle {
    get { self[MarkdownStyleKey.self] }
    set {
        self[MarkdownStyleKey.self] = newValue
    }
  }
}

private struct MarkdownStyleKey: EnvironmentKey {
  static let defaultValue = MarkdownStyle()
}

// MARK: Style
public struct MarkdownStyle: Hashable {
    public var padding: Int?
    public var paddingTop: Int?
    public var paddingRight: Int?
    public var paddingLeft: Int?
    public var paddingBottom: Int?
    public init(padding: Int = 18) {
        self.padding = padding
    }
    public init(paddingTop: Int = 18, paddingBottom: Int = 18, paddingLeft: Int = 18, paddingRight: Int = 18) {
        self.paddingTop = paddingTop
        self.paddingBottom = paddingBottom
        self.paddingLeft = paddingLeft
        self.paddingRight = paddingRight
    }
    public init(padding: Int = 18, paddingTop: Int = 18, paddingBottom: Int = 18, paddingLeft: Int = 18, paddingRight: Int = 18) {
        self.padding = padding
        self.paddingTop = paddingTop
        self.paddingBottom = paddingBottom
        self.paddingLeft = paddingLeft
        self.paddingRight = paddingRight
    }
}

// MARK: WebView
// JS Func
typealias JavascriptCallback = (Result<Any?, Error>) -> Void
private struct JavascriptFunction {
    
    let functionString: String
    let callback: JavascriptCallback?
    
    init(functionString: String, callback: JavascriptCallback? = nil) {
        self.functionString = functionString
        self.callback = callback
    }
}

public class MarkdownWebView: CustomView, WKNavigationDelegate {
    @Environment(\.openURL) private var openURL
    private struct Constants {
        static let mdPreviewDidReady = "mdPreviewDidReady"
        static let mdPreviewDidChanged = "mdPreviewDidChanged"
    }
    private lazy var webview: WKWebView = {
        let preferences = WKPreferences()
        var userController = WKUserContentController()
        userController.add(self, name: Constants.mdPreviewDidReady) // Callback from Ace editor js
        userController.add(self, name: Constants.mdPreviewDidChanged)
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        configuration.userContentController = userController
        let webView = WKWebView(frame: bounds, configuration: configuration)
        webView.navigationDelegate = self
        
        #if os(OSX)
        webView.setValue(true, forKey: "drawsTransparentBackground") // Prevent white flick
        #elseif os(iOS)
        webView.isOpaque = false
        #endif
        
        return webView
    }()
    
    var textDidChanged: ((String) -> Void)?
    
    private var pageLoaded = false
    private var currentContent: String = ""
    private var pendingFunctions = [JavascriptFunction]()
    
    
    override init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
        initWebView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initWebView()
    }
    
    func setContent(_ value: String) {
        
        guard currentContent != value else {
            return
        }
        
        currentContent = value
        //
        // It's tricky to pass FULL JSON or HTML text with \n or "", ... into JS Bridge
        // Have to wrap with `data_here`
        // And use String.raw to prevent escape some special string -> String will show exactly how it's
        // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Template_literals
        //
        let first = "var content = String.raw`"
        let content = """
        \(value)
        """.replacingOccurrences(of: "`", with: "\\`", options: .literal, range: nil)
            .replacingOccurrences(of: "{", with: "\\{", options: .literal, range: nil)
        
        let end = "`; markdownPreview(content.replace(/\\\\`/g, '`').replace(/\\\\{/g, '{'));"

        let script = first + content + end
        callJavascript(javascriptString: script)
        
    }
    func setTheme(_ theme: ColorScheme) {
        if theme == .dark {
            callJavascript(javascriptString: "document.body.classList.add('theme-dark');")
            callJavascript(javascriptString: "document.body.classList.remove('theme-light');")
        } else {
            callJavascript(javascriptString: "document.body.classList.remove('theme-dark');")
            callJavascript(javascriptString: "document.body.classList.add('theme-light');")
        }
    }
    func setPadding(_ padding: Int) {
        callJavascript(javascriptString: "__markdown_preview__.style.padding = '\(padding)px';")
    }
    func setPaddingTop(_ top: Int) {
        callJavascript(javascriptString: "__markdown_preview__.style.paddingTop = '\(top)px';")
    }
    func setPaddingBottom(_ bottom: Int) {
        callJavascript(javascriptString: "__markdown_preview__.style.paddingBottom = '\(bottom)px';")
    }
    func setPaddingLeft(_ left: Int) {
        callJavascript(javascriptString: "__markdown_preview__.style.paddingLeft = '\(left)px';")
    }
    func setPaddingRight(_ right: Int) {
        callJavascript(javascriptString: "__markdown_preview__.style.paddingRight = '\(right)px';")
    }
    ///  open links in browsers
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let url = navigationAction.request.url {
            if url.isFileURL == false {
                openURL(url)
                decisionHandler(.cancel)
                return
            }
        }
        decisionHandler(.allow)
    }
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        /// Disable right-click menu
        webView.evaluateJavaScript("document.body.setAttribute('oncontextmenu', 'event.preventDefault();');", completionHandler: nil);
    }
}


extension MarkdownWebView {
    private func initWebView() {
        webview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(webview)
        webview.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        webview.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        webview.topAnchor.constraint(equalTo: topAnchor).isActive = true
        webview.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        guard let bundlePath = Bundle.module.path(forResource: "web", ofType: "bundle"),
            let bundle = Bundle(path: bundlePath),
            let indexPath = bundle.path(forResource: "index", ofType: "html") else {
                fatalError("Ace editor is missing")
        }
        
        let data = try! Data(contentsOf: URL(fileURLWithPath: indexPath))
        webview.load(data, mimeType: "text/html", characterEncodingName: "utf-8", baseURL: bundle.resourceURL!)
    }
    private func addFunction(function: JavascriptFunction) {
        pendingFunctions.append(function)
    }
    private func callJavascriptFunction(function: JavascriptFunction) {
        webview.evaluateJavaScript(function.functionString) { (response, error) in
            if let error = error {
                function.callback?(.failure(error))
            }
            else {
                function.callback?(.success(response))
            }
        }
    }
    private func callPendingFunctions() {
        for function in pendingFunctions {
            callJavascriptFunction(function: function)
        }
        pendingFunctions.removeAll()
    }
    private func callJavascript(javascriptString: String, callback: JavascriptCallback? = nil) {
        if pageLoaded {
            callJavascriptFunction(function: JavascriptFunction(functionString: javascriptString, callback: callback))
        }
        else {
            addFunction(function: JavascriptFunction(functionString: javascriptString, callback: callback))
        }
    }
}


// MARK: WKScriptMessageHandler

extension MarkdownWebView: WKScriptMessageHandler {

    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {

        // is Ready
        if message.name == Constants.mdPreviewDidReady {
            pageLoaded = true
            callPendingFunctions()
            return
        }
        
        // is Text change
        if message.name == Constants.mdPreviewDidChanged,
           let text = message.body as? String {
            
            self.textDidChanged?(text)

            return
        }
    }
}

