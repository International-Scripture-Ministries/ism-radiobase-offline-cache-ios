import Foundation

@objc public class OfflineDB: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
}
