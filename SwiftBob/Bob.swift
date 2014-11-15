//
//  Bob.swift
//  SwiftBob
//
//  Created by BJ Miller on 6/16/14.
//  Copyright (c) 2014 Six Five Software, LLC. All rights reserved.
//

import Foundation

class Bob {
    class func hey(input: String) -> String {
        
        var result = "Whatever."
        
        if isShouting(input) {
            result = "Woah, chill out!"
        } else if isQuestion(input) {
            result = "Sure."
        } else if isSilent(input) {
            result = "Fine, be that way."
        }
        
        return result
        
    }
    
    class func isShouting(input: String) -> Bool {
        return input == input.uppercaseString && containsAtLeastOneLetter(input)
    }
    
    class func isQuestion(input: String) -> Bool {
        return input.hasSuffix("?")
    }
    
    class func isSilent(input: String) -> Bool {
        return input.isEmpty || removeOuterWhitespace(input).isEmpty
    }
    
    class func containsAtLeastOneLetter(input: String) -> Bool {
        let regex = NSRegularExpression(pattern: "[A-Za-z]", options: NSRegularExpressionOptions.CaseInsensitive, error: nil)
        let matches = regex?.matchesInString(input, options: NSMatchingOptions.ReportCompletion, range: NSMakeRange(0, countElements(input)))
        if let matches = matches {
            if matches.isEmpty { return false }
        }
        /*
        if matches?.isEmpty {
            return false
        }
        */
        return true
    }
    
    class func removeOuterWhitespace(input: String) -> String {
        var mutableResult: String = ""
        for character in input {
            if character != " " {
//                mutableResult = mutableResult + character
                mutableResult.append(character)
            }
        }
        return mutableResult
    }
}