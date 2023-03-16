//
//  ViewController.swift
//  calc7
//
//  Created by OneClick on 14/3/23.
//

import UIKit



class ViewController: UIViewController {

    var firstNumber: Double = 0.0
    var operation: String = ""
    var secondNumber: Double = 0.0
    var result: Double = 0.0
    
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create a UIView instance
        let myView = UIView()

        // Add it as a subview to the main view
        view.addSubview(myView)

        // Set up Auto Layout constraints to keep the view within the safe area
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        myView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        myView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        myView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }

    @IBAction func numberButtonPressed(_ sender: UIButton) {
        let digit = sender.currentTitle!
        let currentText = displayLabel.text!
        
        if currentText == "0" {
            displayLabel.text = digit
        } else {
            displayLabel.text = currentText + digit
        }
    }
    
    @IBAction func decimalButtonPressed(_ sender: UIButton) {
        let currentText = displayLabel.text!
        
        if !currentText.contains(".") {
            displayLabel.text = currentText + "."
        }
    }
    
    
    // ????
    @IBAction func percentageButtonPressed(_ sender: UIButton) {
        let currentText = displayLabel.text!
        
        if let value = Double(currentText) {
            displayLabel.text = String(value / 100)
        }
    }
    
    @IBAction func negativeButtonPressed(_ sender: UIButton) {
        let currentText = displayLabel.text!
        
        if let value = Double(currentText) {
            displayLabel.text = String(-value)
        }
    }
    
    @IBAction func operationButtonPressed(_ sender: UIButton) {
        let currentText = displayLabel.text!
        
        if let value = Double(currentText) {
            if firstNumber == 0 {
                firstNumber = value
            } else {
                secondNumber = value
            }
        }
        
        if let op = sender.currentTitle {
            operation = op
        }
        
        displayLabel.text = "0"
    }
    
    @IBAction func equalsButtonPressed(_ sender: UIButton) {
        let currentText = displayLabel.text!
        
        if let value = Double(currentText) {
            secondNumber = value
        }
        
        switch operation {
        case "+":
            result = firstNumber + secondNumber
        case "-":
            result = firstNumber - secondNumber
        case "*":
            result = firstNumber * secondNumber
        case "/":
            result = firstNumber / secondNumber
        default:
            break
        }
        
        firstNumber = result
        displayLabel.text = String(result)
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        displayLabel.text = "0"
        firstNumber = 0.0
        operation = ""
        secondNumber = 0.0
        result = 0.0
    }
}
