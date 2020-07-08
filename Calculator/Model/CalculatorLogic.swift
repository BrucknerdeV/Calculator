//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Bruckner de Villiers on 2020/07/07.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {// Changed from class to struct
    
    private var number: Double?
    
    // *** structs do not require inititialisers like classes
    //    init(number: Double) {
    //        self.number = number
    //    }
    
    private var intermediateCalculation: (n1: Double, calcMethod: String)?// No values yet
    
    mutating func setNumber(_ number: Double) {// Set external parameter name to nothing and set internal paraname to content of the function
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return performTwoNumCalculation(n2: n)
            default:
                intermediateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod {
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The operation does not match any of the cases.")
            }
            //            if operation == "+" {
            //                return n1 + n2
            //            } else if operation == "-" {
            //                return n1 - n2
            //            } else if operation == "x" {
            //                return n1 * n2
            //            } else {
            //                return n1 / n2
            //            }
        }
        return nil
    }
    
}
