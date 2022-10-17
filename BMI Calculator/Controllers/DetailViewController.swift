//
//  DetailViewController.swift
//  BMI Calculator
//
//  Created by Karpinets Alexander on 05.09.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var tryAgainButton: UIButton!
    
    var resultText: String?
    var resultPhoto: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    @IBAction func buttonTryAgain(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func shareButton(_ sender: Any) {
        let shareButton = UIActivityViewController(
            activityItems: [resultLabel.text ?? "", resultImage.image ?? ""],
            applicationActivities: nil)
        present(shareButton, animated: true, completion: nil)
    }
    
    private func setUpUI() {
        resultLabel.text = resultText
        resultImage.image = resultPhoto
        tryAgainButton.dropShadow()
        navigationItem.setHidesBackButton(true, animated: true)
    }
}
