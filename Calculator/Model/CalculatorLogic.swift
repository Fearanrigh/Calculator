//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Sean Barton on 2020-11-19.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

class CalculatorLogic {
    
    var number : Double
    
    init(number : Double) {
        self.number = number
    }
    
    func calculate(_ name : String) -> Double? {

        if name == "+/-" {
            return number * -1
        } else if name == "AC" {
            return 0
        } else if name == "%" {
            return number / 100.0
        }
        return nil
    }
}
