//
//  CoinTrackerTests.swift
//  CoinTrackerTests
//
//  Created by Oleg Ryasnoy on 21.05.2018.
//  Copyright © 2018 Oleg Ryasnoy. All rights reserved.
//

import XCTest
@testable import CoinTracker

class CoinTrackerTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testDecode() {

    do {
      let result = try JSONDecoder().decode(RawServerResponse.self, from: mockData.data(using: .utf8)!)
      print(result)
    } catch {
      XCTFail(error.localizedDescription)
    }
    
    
  }
  
  
}


