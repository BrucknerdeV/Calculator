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
    
    mutating func setNumber(_ number: Double) {// Set external parameter name to nothing and set internal paraname to content of the function
        self.number = number
    }
    
    func calculate(symbol: String) -> Double? {
        if let n = number {
            if symbol == "+/-" {
                return n * -1
            } else if symbol == "AC" {
                return 0
            } else if symbol == "%" {
                return n * 0.01
            }
        }
        return nil
    }
    
}
