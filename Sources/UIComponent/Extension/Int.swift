@available(iOS 15, macOS 12.0, *)
extension Int {
    public func format(_ to: String) -> String {
        return String(format: "%\(to)d", self)
    }
}
