//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Bruckner de Villiers on 2020/07/07.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {// Changed from class to struct
    
    var number: Double
    
    init(number: Double) {
        self.number = number
    }
    
    
    func calculate(symbol: String) -> Double? {
        
            if symbol == "+/-" {
                return number * -1
            } else if symbol == "AC" {
                return 0
            } else if symbol == "%" {
                return number * 0.01
            }
        return nil
    }
}
