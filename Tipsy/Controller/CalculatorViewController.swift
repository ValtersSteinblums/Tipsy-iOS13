//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipSelected = 0.10
    var headCount = 2
    var totalDue = 0.0
    var perHeadDue = "0.0"
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleNoPercent = String(buttonTitle.dropLast())
        let buttonTitleAsNumber = Double(buttonTitleNoPercent)!
        tipSelected = buttonTitleAsNumber / 100
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        headCount = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let amountDue = billTextField.text?.doubleValue ?? 0.0
        let totalDue = amountDue * (1 + tipSelected) / Double(headCount)
        let perHeadDue = String(format: "%.2f", totalDue)
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let ResultVC = storyboard.instantiateViewController(withIdentifier: "Results") as! ResultsViewController
        ResultVC.total = perHeadDue
        ResultVC.headCount = headCount
        ResultVC.tipPercentage = Int(tipSelected * 100)
        self.present(ResultVC, animated: true)
    }
}

extension String {
    var doubleValue: Double {
        return Double(self) ?? 0
    }
}

