import XCTest
@testable import Example
import ACDD

class SumCalculator_Tests: XCTestCase {
    
    override class func setUp() {
        ACDD.defaultLogger = SimpleLogger()
    }

    func test_success() throws {
    
        var calculator = SumCalculator()
        
        try AC(title: "Calculator should be able to sum")
            .given("4 is entered into the calculator") {
                calculator.firstNumber = 4
            }
            .and("5 is entered into the calculator") {
                calculator.secondNumber = 5
            }
            .when("the sum is computed") {
                try calculator.computeSum()
            }
            .then("the output is 9") {
                XCTAssertEqual(calculator.output!, 9)
            }
    }
    
    func test_no_input() throws {
        
        var calculator = SumCalculator()
        
        try AC()
            .given("no numbers have been entered into the calculator")
            .when("the sum is computed") {
                XCTAssertThrowsError(try calculator.computeSum())
            }
            .then("the output remains as nil") {
                XCTAssertNil(calculator.output)
            }
    }

}
