//
//  DiningPhilosophersTests.swift
//  DiningPhilosophersTests
//
//  Created by Oleksiy Chebotarov on 05/11/2022.
//

@testable import DiningPhilosophers
import XCTest

final class DiningPhilosophersTests: XCTestCase {
    var table: Table!
    var philosophers: [Philosopher]!

    override func setUpWithError() throws {
        table = Table(philosophers: 5)
        philosophers = table.philosophersAtTable()
    }

    override func tearDownWithError() throws {
        table = nil
        philosophers = nil
    }

    func testPhilosopherIndexZero() throws {
        let philosopher = philosophers.first

        XCTAssertEqual(philosopher?.number, 0)
        XCTAssertEqual(philosopher?.leftFork.number, 4)
        XCTAssertEqual(philosopher?.rihgtFork.number, 0)
    }

    func testPhilosopherIndexOne() throws {
        let philosopher = philosophers[1]
        XCTAssertEqual(philosopher.number, 1)
        XCTAssertEqual(philosopher.leftFork.number, 0)
        XCTAssertEqual(philosopher.rihgtFork.number, 1)
    }

    func testPhilosopherIndexTwo() throws {
        let philosopher = philosophers[2]

        XCTAssertEqual(philosopher.number, 2)
        XCTAssertEqual(philosopher.leftFork.number, 1)
        XCTAssertEqual(philosopher.rihgtFork.number, 2)
    }

    func testPhilosopherIndexThree() throws {
        let philosopher = philosophers[3]

        XCTAssertEqual(philosopher.number, 3)
        XCTAssertEqual(philosopher.leftFork.number, 2)
        XCTAssertEqual(philosopher.rihgtFork.number, 3)
    }

    func testPhilosopherIndexFour() throws {
        let philosopher = philosophers[4]

        XCTAssertEqual(philosopher.number, 4)
        XCTAssertEqual(philosopher.leftFork.number, 3)
        XCTAssertEqual(philosopher.rihgtFork.number, 4)
    }

    func testSameForksAtTablebyIndex1() throws {
        let philosopher_index0 = philosophers[0]
        let philosopher_index1 = philosophers[1]

        XCTAssertEqual(philosopher_index0.rihgtFork, philosopher_index1.leftFork)
    }

//    func testSameForksAtTablebyIndex0() throws {
//        let philosopher_index0 = philosophers[0]
//        let philosopher_index1 = philosophers[1]
//
//        XCTAssertEqual(philosopher_index0.rihgtFork, philosopher_index1.leftFork)
//    }

    func testPhilosopherContaintFiveOnly() throws {
        XCTAssert(philosophers.indices.contains(4), "Index out of bounds")
    }
}
