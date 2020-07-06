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
    
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true // Allows new number to be entered
        
        guard let number = Double(displayLabel.text!) else {
            fatalError("Cannot convert a display label text to a Double.")
        }
        
        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
                displayLabel.text = String(number * -1)
            } else if calcMethod == "AC" {
                displayLabel.text = "0"
            } else if calcMethod == "%" {
                displayLabel.text = String(number / 100)
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
                //                if numValue == "." {
                //                    guard let currentDisplayValue = Double(displayLabel.text!) else {
                //                        fatalError("Cannot convert display label to a Double.")
                //                    }
                //                    let isInt = floor(currentDisplayValue) == currentDisplayValue
                //                    if !isInt {
                //                        return //Force return if integer
                //                    }
                
                
                
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
    
}

