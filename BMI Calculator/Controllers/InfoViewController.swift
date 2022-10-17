//
//  InfoViewController.swift
//  BMI Calculator
//
//  Created by Karpinets Alexander on 01.11.2021.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTextLabel()
    }
    
    private func updateTextLabel() {
        let path = "https://en.m.wikipedia.org/wiki/Body_mass_index"
        let text = textLabel.text ?? ""
        let attributedString = NSAttributedString.makeHyperLink(
            for: path,
               in: text,
               as: "Link")
        let font = textLabel.font
        let textColor = textLabel.textColor
        textLabel.attributedText = attributedString
        textLabel.textAlignment = NSTextAlignment.justified
        textLabel.font = font
        textLabel.textColor = textColor
    }
}


