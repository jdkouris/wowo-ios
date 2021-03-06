//
//  UserModelTests.swift
//  ExpressWashTests
//
//  Created by Joel Groomer on 5/7/20.
//  Copyright © 2020 Bobby Keffury. All rights reserved.
//

import XCTest
@testable import ExpressWash

class UserModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUserModel() throws {
        // tests User and UserRepresentation computed property

        let user = User(accountType: "client", email: "email@email.com", firstName: "Test", lastName: "User")
        XCTAssert(user.userId == NOID32)
        XCTAssert(user.email == "email@email.com")
        XCTAssert(user.firstName == "Test")
        XCTAssert(user.lastName == "User")

        let representation = user.representation
        XCTAssert(representation.userId == NOID)
        XCTAssert(representation.email == "email@email.com")
        XCTAssert(representation.firstName == "Test")
        XCTAssert(representation.lastName == "User")
    }

}
