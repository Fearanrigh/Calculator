//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Sean Barton on 2020-11-19.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number : Double?
    
    private var intermediateCalcuation : (n1 : Double, calcMethod : String)?
    
    mutating func setNumber(_ number : Double) {
        self.number = number
    }
    
    mutating func calculate(symbol : String) -> Double? {

        if let n = number {
            if symbol == "+/-" {
                return n * -1
            } else if symbol == "AC" {
                return 0
            } else if symbol == "%" {
                return n / 100.0
            } else if symbol == "=" {
                return performTwoNumberCalculation(n2: n)
            } else {
                intermediateCalcuation = (n1 : n, calcMethod : symbol)
                return n
            }
        }
        return nil
    }
    
    private func performTwoNumberCalculation(n2 : Double) -> Double {
        if let n1 = intermediateCalcuation?.n1,
           let operation = intermediateCalcuation?.calcMethod {
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
                return 0
            }
        }
        return 0
    }
}
