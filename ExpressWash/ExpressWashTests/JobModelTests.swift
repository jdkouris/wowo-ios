//
//  JobModelTests.swift
//  ExpressWashTests
//
//  Created by Joel Groomer on 5/7/20.
//  Copyright © 2020 Bobby Keffury. All rights reserved.
//

import XCTest
@testable import ExpressWash

class JobModelTests: XCTestCase {

    let testAboutMe = "I'm a washer"
    let testLat = 35.8609
    let testLon = -120.8200
    let testRateSmall = 25.0
    let testRateMedium = 40.0
    let testRateLarge = 55.0

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testJobModel() throws {
        let user = User(accountType: "client", email: "email@email.com", firstName: "Test", lastName: "User")
        let washerUser = User(accountType: "washer", email: "washer@email.com", firstName: "Test", lastName: "User")
        user.userId = 1
        washerUser.userId = 2

        let washer = Washer(aboutMe: testAboutMe,
                            available: false,
                            currentLocationLat: testLat,
                            currentLocationLon: testLon,
                            rateSmall: testRateSmall,
                            rateMedium: testRateMedium,
                            rateLarge: testRateLarge,
                            washerId: NOID32,
                            washerRating: 3,
                            washerRatingTotal: 3,
                            user: washerUser)

        let job = Job(jobLocationLat: 32.7353,
                      jobLocationLon: -117.1490,
                      address: "2920 Zoo Dr.",
                      city: "San Diego",
                      state: "CA",
                      zip: "92101",
                      jobType: "wash")

        let car1 = Car(carId: 1,
                       make: "Ford",
                       model: "Taurus",
                       year: 2016,
                       color: "White",
                       licensePlate: "1ABC234",
                       photo: nil,
                       size: CarSize.medium.rawValue)
        user.addToCars(car1)

        XCTAssert(job.jobLocationLat == 32.7353)
        XCTAssert(job.jobLocationLon == -117.1490)
        XCTAssert(job.address == "2920 Zoo Dr.")
        XCTAssert(job.city == "San Diego")
        XCTAssert(job.state == "CA")
        XCTAssert(job.zip == "92101")
        XCTAssert(job.jobType == "wash")

        job.client = user
        job.washer = washer
        job.car = car1

        XCTAssert(user.jobs!.contains(job))
        XCTAssert(washer.jobs!.contains(job))
        XCTAssert(car1.jobs!.contains(job))
        XCTAssert(job.washer.user == washerUser)
        XCTAssert(user.cars!.contains(job.car))

    }

}
