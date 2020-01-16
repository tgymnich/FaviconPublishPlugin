import XCTest
import Ink
@testable import FaviconPublishPlugin

final class GoogleFaviconPublishPluginTests: XCTestCase {
    
    func testFaviconMarkdown() {
        let parser = MarkdownParser(modifiers: [.addFaviconsToLinks()])
        
        let html = parser.html(from: """
        [google](https://www.google.de)
        """)
        
        let expected = """
        <p><style>a[href*=\"www.google.de\"]{background-image: url(https://www.google.com/s2/favicons?domain=www.google.de);}</style><a href=\"https://www.google.de\">google</a></p>
        """

        XCTAssertEqual(html, expected)
    }
    
    static var allTests = [
            ("testFaviconMarkdown", testFaviconMarkdown)
        ]
}

