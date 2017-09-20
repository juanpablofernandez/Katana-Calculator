//
//  CalculatorUtils.swift
//  Katana Calculator
//
//  Created by Juan Pablo on 9/19/17.
//  Copyright © 2017 Juan Pablo Fernandez. All rights reserved.
//

import Foundation

struct CalculatorUtils {
    
    private init() {}
    
    static func calculate(operation: Operation, firstNumber: Double, secondNumber: Double) -> Double {
//        let firstNumber = Double(firstNumberText)!
//        let secondNumber = Double(secondNumberText)!
//        firstNumberText = ""
//        secondNumberText = ""
        
        switch operation {
        case .add:
            return firstNumber + secondNumber
        case .subtract:
            return firstNumber - secondNumber
        case .multiply:
            return firstNumber * secondNumber
        case .divide:
            return firstNumber / secondNumber
        }
    }
    
    static func getOperationFor(stringOperation: String) -> Operation {
        
        switch stringOperation {
        case "+":
            return .add
        case "-":
            return .subtract
        case "*":
            return .multiply
        case "/":
            return .divide
        default:
            fatalError("Invalid state")
        }
    }
}
