//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Karpinets Alexander on 02.09.2021.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var calculateButton: UIButton!
    
    private var bmi = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weightTextField.inputAccessoryView = toolBar()
        heightTextField.inputAccessoryView = toolBar()
        calculateButton.dropShadow()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailViewController else {return}
        detailVC.resultText = getBmi()
        detailVC.resultPhoto = getImage()
    }
    
    @IBAction func unwindSegue(for unwindSegue: UIStoryboardSegue) {
        weightTextField.text = ""
        heightTextField.text = ""
    }
    
    @IBAction func buttonPressedAction(_ sender: UIButton) {
        if weightTextField.text == "" ||
            heightTextField.text == "" {
            showAlert(title: "Warning!", message: "Please enter your weight & height")
        }
    }
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            weightTextField.text = ""
            heightTextField.text = ""
            weightTextField.placeholder = "kg"
            heightTextField.placeholder = "cm"
        } else {
            weightTextField.text = ""
            heightTextField.text = ""
            weightTextField.placeholder = "lb"
            heightTextField.placeholder = "in"
        }
    }
    
    private func tappedFeedbackWarning() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.warning)
    }
    
    private func getBmi() -> String {
        guard let height = Double(heightTextField.text ?? "") else { return "" }
        guard let weight = Double(weightTextField.text ?? "") else { return "" }
        
        if segmentControl.selectedSegmentIndex == 0 {
            bmi = weight / pow(height, 2) * 10000
        } else {
            bmi = weight / pow(height, 2) * 703
        }
        return ("Your bmi is \(String(format: "%.1f", bmi))")
    }
    
    private func getImage() -> UIImage? {
        guard let height = Double(heightTextField.text ?? "") else { return UIImage(named: "normal") }
        guard let weight = Double(weightTextField.text ?? "") else { return UIImage(named: "normal") }
        
        if segmentControl.selectedSegmentIndex == 0 {
            bmi = weight / pow(height, 2) * 10000
        } else {
            bmi = weight / pow(height, 2) * 703
        }
        
        switch bmi {
        case 0..<18.5:
            return UIImage(named: "underweight")
        case 18.5..<24.9:
            return UIImage(named: "normal")
        case 25..<29.9:
            return UIImage(named: "overweight")
        case 30..<39.9:
            return UIImage(named: "obese")
        case 40...:
            return UIImage(named: "extremelyObese")
        default:
            return nil
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default)
        alert.addAction(okAction)
        present(alert, animated: true, completion: tappedFeedbackWarning)
    }
}

extension StartViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
