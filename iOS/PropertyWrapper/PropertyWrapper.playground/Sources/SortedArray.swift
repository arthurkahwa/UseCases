import Foundation

@propertyWrapper
public class SortedArray<Element: Comparable> {
    public init() {}
    
    private(set) var value: [Element] = []
    
    public var wrappedValue: [Element] {
        get { value }
        set {
            self.value = newValue.sorted(by: { $0 < $1 })
        }
    }
}
