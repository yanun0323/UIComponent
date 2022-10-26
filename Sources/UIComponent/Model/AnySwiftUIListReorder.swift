import Foundation
import SwiftUI

@available(iOS 15, macOS 12.0, *)
final public class AnySwiftUIListReorder: NSObject, NSItemProviderReading, NSItemProviderWriting, Codable {
    static public var readableTypeIdentifiersForItemProvider: [String] = ["com.apple.SwiftUI.listReorder"]
    static public func object(withItemProviderData data: Data, typeIdentifier: String) throws -> AnySwiftUIListReorder {
        let decoder = JSONDecoder()
        let reorderData = try decoder.decode(AnySwiftUIListReorder.self, from: data)
        return reorderData
    }
    
    static public var writableTypeIdentifiersForItemProvider: [String] = ["com.apple.SwiftUI.listReorder"]
    public func loadData(
        withTypeIdentifier typeIdentifier: String,
        forItemProviderCompletionHandler completionHandler: @escaping (Data?, Error?) -> Void
    ) -> Progress? {
    let encoder = JSONEncoder()
    do {
      let json = try encoder.encode(self)
      completionHandler(json, nil)
    } catch {
      print(error.localizedDescription)
      completionHandler(nil, error)
    }
    return nil
    }

    public var data: Data
    public init(_ data: Data) {
        self.data = data
    }
}

