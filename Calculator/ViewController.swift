//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true // 5 levels of privacy: private = between {}, fileprivate = inside one file, internal = across a module (default), public = across modules, open = public + can be overridden
    
    private var displayValue: Double {// Use of Computed Properties to simplify Strings to Doubles to Strings
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert a display label text to a Double.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true // Allows new number to be entered
        
        
        
        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
                displayValue = displayValue * -1
            } else if calcMethod == "AC" {
                displayLabel.text = "0"
            } else if calcMethod == "%" {
                displayValue *= 0.01// Short version of displayValue = displayValue /100
            }
        }
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        //1. Determine which number was pressed
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false // Force drop into else
            } else {
                if numValue == "." && displayLabel.text!.contains(".") {
                    return// check for duplicate "."
                }
                
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
    
}

