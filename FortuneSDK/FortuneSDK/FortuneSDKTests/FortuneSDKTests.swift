//
//  FortuneSDKTests.swift
//  FortuneSDKTests
//
//  Created by Arthur Nsereko Kahwa on 3/29/23.
//

import XCTest
@testable import FortuneSDK

final class FortuneSDKTests: XCTestCase {
    func testFortune() throws {
        
        let fortune = SDK().fortune
        
        XCTAssertNotNil(fortune, "The fortune is empty or nil")
    }
}
