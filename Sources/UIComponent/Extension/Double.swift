@available(iOS 15, macOS 12.0, *)
extension Double {
    public func format(_ to: String) -> String {
        return String(format: "%\(to)f", self)
    }
}
