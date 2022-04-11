//
//  StringExtension.swift
//  frogtest
//
//  Created by Alfredo Tochon on 4/8/22.
//

import Foundation
import UIKit

// MARK: - Contains Helper functions that is regularly used on a String
public extension String {
    
    /// check if sub string exist
    func contains(subString: String) -> Bool {
        return (self.range(of: subString) != nil) ? true : false
    }
    
    /// Get the width for string
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
    
    /// Localized current string key
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    /// Localized text using string key
    static func localized(_ key:String) -> String {
        return NSLocalizedString(key, comment: "")
    }
    
    /// Remove spaces and new lines
    var trimed :String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
}

