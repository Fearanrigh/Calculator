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
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n / 100.0
            case "=":
                return performTwoNumberCalculation(n2: n)
            default:
                intermediateCalcuation = (n1 : n, calcMethod : symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumberCalculation(n2 : Double) -> Double? {
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
                fatalError("The operation passed in does match any of the cases.")
            }
        }
        return nil
    }
}
