import Foundation

public class SpaceConvertRule: SplitRule {
    public override func split(from text: String) -> [Raw] {
        let result = text
            .replace(by: "\r", with: "")
            .replace(by: "\t", with: "    ")
        return [Raw(lock: false, text: result)]
    }
}
