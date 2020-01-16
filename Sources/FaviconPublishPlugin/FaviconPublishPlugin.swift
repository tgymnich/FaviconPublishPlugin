
import Publish
import Splash
import Ink
import Foundation
import Plot

public extension Plugin {
    static func addFaviconsToLinks(in modifier: String = ".wrapper") -> Self {
        Plugin(name: "Favicons") { context in
            context.markdownParser.addModifier(
                .addFaviconsToLinks(in: modifier)
            )
        }
    }
}

public extension Modifier {
    static func addFaviconsToLinks(in modifier: String = ".wrapper") -> Self {
        return Modifier(target: .links) { html, markdown -> String in
            guard let urlStart = markdown.range(of: "(")?.upperBound,
                let urlEnd = markdown.range(of: ")")?.lowerBound,
                let urlHost = URL(string: String(markdown[urlStart..<urlEnd]))?.host else { return html }
                        
            let style = #"<style>\#(modifier) a[href*="\#(urlHost)"]{background-image: url(https://www.google.com/s2/favicons?domain=\#(urlHost);}</style>"#
            return style.appending(html)
        }
    }
}
