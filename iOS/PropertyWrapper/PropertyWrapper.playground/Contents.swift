import Foundation

struct UrlEncodeExample {
    @UrlEncoded
    var myEncodedUri: String
}

extension UrlEncodeExample {
    init(myEncodedUri: String) {
        self.myEncodedUri = myEncodedUri
    }
}

struct SortedArrayExample {
    @SortedArray
    var toBeSorted: [Int]
}

extension SortedArrayExample {
    init(toBeSorted: [Int]) {
        self.toBeSorted = toBeSorted
    }
}

example(of: "Url Encoding ") {
    let someUri = UrlEncodeExample(myEncodedUri: "to be encoded")
    print(someUri.myEncodedUri)
}

example(of: "Array Sorting") {
    let unsorted = [2, 9, 11, 1, 8,4, 3]
    let otherExample = SortedArrayExample(toBeSorted: unsorted)
    print(otherExample.toBeSorted)
}
