//
//  NSAttributedStringExtension.swift
//  BMI Calculator
//
//  Created by Karpinets Alexander on 27.11.2021.
//

import Foundation

extension NSAttributedString {
    
    static func makeHyperLink(for path: String,
                              in string: String,
                              as substring: String) -> NSAttributedString {
        let nsString = NSString(string: string)
        let substringRange = nsString.range(of: substring)
        let attributedString = NSMutableAttributedString(string: string)
        attributedString.addAttribute(.link, value: path, range: substringRange)
        return attributedString
    }
}
