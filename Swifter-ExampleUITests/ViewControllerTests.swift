//
//  ViewControllerTests.swift
//  Swifter-ExampleUITests
//
//  Created by Ben Lambert on 7/17/18.
//  Copyright © 2018 Collective Idea. All rights reserved.
//

import XCTest

class ViewControllerTests: XCTestCase {
        
    let stubs = DynamicStubs()
    
    lazy var app: XCUIApplication = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        
        app.launchArguments += ["TESTING"]
        
        try! stubs.server.start()
        
        continueAfterFailure = false
    }
    
    override func tearDown() {
        super.tearDown()
        stubs.server.stop()
    }
    
    func testViewControllerShowsPeople() {
        stubs.stubRequest(path: "/people", jsonData: PersonStubbedJSON().jsonData!)
        
        app.launch()
        
        // used so you can see the results before it completes
        sleep(3)
        
        let peopleCellCount = app.tables.cells.matching(identifier: "personCell").count
        XCTAssertEqual(peopleCellCount, 2, "Number Of cells do not match stubbed data")
    }
    
}
