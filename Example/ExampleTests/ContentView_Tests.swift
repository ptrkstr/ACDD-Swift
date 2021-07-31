import XCTest
@testable import Example
import ACDD
import ViewInspector

extension ContentView: Inspectable {}

class ContentView_Tests: XCTestCase {
    
    func test_text_exists() throws {
        
        var contentView: ContentView!
        
        try AC()
            .when("the screen appears") {
                contentView = ContentView()
            }
            .then("I can see `Hello, world!`") {
                let inspection = try contentView.inspect()
                XCTAssertNoThrow(try inspection.find(text: "Hello, world!"))
            }
    }
}
