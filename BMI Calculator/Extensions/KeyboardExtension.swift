//
//  KeyboardExtension.swift
//  BMI Calculator
//
//  Created by Karpinets Alexander on 12.10.2021.
//

import UIKit

extension UIViewController {
    func toolBar() -> UIToolbar{
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let buttonTitle = "Done"
        let doneButton = UIBarButtonItem(title: buttonTitle,
                                         style: .done, target: self,
                                         action: #selector(onClickDoneButton))
        doneButton.tintColor = .systemBlue
        toolBar.setItems([space, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        return toolBar
    }
    
    @objc func onClickDoneButton(){
        view.endEditing(true)
    }
}
