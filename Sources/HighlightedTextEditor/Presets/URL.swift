import Foundation
import SwiftUI

private let urlRegexPattern =
    "https?://(www\\.)?[-a-zA-Z0-9@:%._\\+~#=]{2,256}\\.[a-z]{2,4}\\b([-a-zA-Z0-9@:%_\\+.~#?&//=]*)"
private let _urlRegex = try! NSRegularExpression(pattern: urlRegexPattern, options: [])

public extension Sequence where Iterator.Element == HighlightRule {
    static var url: [HighlightRule] {
        [
            HighlightRule(pattern: _urlRegex, formattingRules: [
                TextFormattingRule(key: .underlineStyle, value: NSUnderlineStyle.single.rawValue),
                TextFormattingRule(key: .link) { urlString, _ in
                    URL(string: urlString) as Any
                }
            ])
        ]
    }
}

public extension HighlightRule {
    static var urlRegex: NSRegularExpression {
        _urlRegex
    }
}
