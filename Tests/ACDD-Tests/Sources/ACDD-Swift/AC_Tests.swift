import XCTest
@testable import ACDD

final class AC_Tests: XCTestCase {
    
    func test_log_title() {
        
        let exp = expectation(description: "title is logged")
        
        let logger = Logger_Mock(didLogAC: { ac in
            XCTAssertEqual(ac.title, "title")
            exp.fulfill()
        })
        
        _ = AC(title: "title", logger: logger)
        
        waitForExpectations(timeout: 1)
    }

    func test_given_when_then() {
        
        var events: [LoggerEvent]  = [
            .init(clause: .given, description: "1"),
            .init(clause: .when, description: "2"),
            .init(clause: .then, description: "3")
        ]
        
        let logger = Logger_Mock(didLogEvent: { event in
            XCTAssertEqual(event, events.first!)
            events.removeFirst()
        })
        
        AC(logger: logger)
            .given("1")
            .when("2")
            .then("3")
        
        XCTAssertTrue(events.isEmpty)
    }

    func test_given_and_and_when_then() {
        
        var events: [LoggerEvent]  = [
            .init(clause: .given, description: "1"),
            .init(clause: .and, description: "2"),
            .init(clause: .and, description: "3"),
            .init(clause: .when, description: "4"),
            .init(clause: .then, description: "5"),
        ]
        
        let logger = Logger_Mock(didLogEvent: { event in
            XCTAssertEqual(event, events.first!)
            events.removeFirst()
        })
        
        AC(logger: logger)
            .given("1")
            .and("2")
            .and("3")
            .when("4")
            .then("5")
        
        XCTAssertTrue(events.isEmpty)
    }
    
    func test_given_when_and_and_then() {
        
        var events: [LoggerEvent]  = [
            .init(clause: .given, description: "1"),
            .init(clause: .when, description: "2"),
            .init(clause: .and, description: "3"),
            .init(clause: .and, description: "4"),
            .init(clause: .then, description: "5"),
        ]
        
        let logger = Logger_Mock(didLogEvent: { event in
            XCTAssertEqual(event, events.first!)
            events.removeFirst()
        })
        
        AC(logger: logger)
            .given("1")
            .when("2")
            .and("3")
            .and("4")
            .then("5")
        
        XCTAssertTrue(events.isEmpty)
    }
    
    func test_given_when_then_and_and() {
        
        var events: [LoggerEvent]  = [
            .init(clause: .given, description: "1"),
            .init(clause: .when, description: "2"),
            .init(clause: .then, description: "3"),
            .init(clause: .and, description: "4"),
            .init(clause: .and, description: "5"),
        ]

        let logger = Logger_Mock(didLogEvent: { event in
            XCTAssertEqual(event, events.first!)
            events.removeFirst()
        })
        
        AC(logger: logger)
            .given("1")
            .when("2")
            .then("3")
            .and("4")
            .and("5")
        
        XCTAssertTrue(events.isEmpty)
    }
}
