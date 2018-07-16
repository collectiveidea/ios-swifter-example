//
//  PersonFromJsonTest.swift
//  SwifterTests
//
//  Created by Ben Lambert on 7/16/18.
//  Copyright © 2018 Collective Idea. All rights reserved.
//

import XCTest

class PersonFromJsonTest: XCTestCase {
    
    var peopleControlValues = [
        Person(name: "Johnny McBiggs", favoriteThings: ["Sausages",
                                                        "Pancackes",
                                                        "Cheeseburgers"]),
        Person(name: "Nancy Foofoo", favoriteThings: ["Sprinkles",
                                                      "Puppies",
                                                      "Unicorns"])
    ]
        
    func testPersonFromJson() {
        guard let data = PersonStubbedJSON().jsonData else {
            XCTFail("Could not convert Person JSON to data")
            return
        }
        
        let decoder = JSONDecoder()
        do {
            let people = try decoder.decode([Person].self, from: data)
            XCTAssertEqual(people, peopleControlValues, "People from JSON do not match control values")
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
}
