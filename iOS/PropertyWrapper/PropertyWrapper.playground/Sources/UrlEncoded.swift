import Foundation

@propertyWrapper
public class UrlEncoded {
    public init() {}
    
    private(set) var value = ""
    
    public var wrappedValue: String {
        get { value }
        set {
            if let uri = newValue.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
                self.value = uri
            }
        }
    }
}
