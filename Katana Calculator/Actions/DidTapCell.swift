//
//  DidTapCell.swift
//  Katana Calculator
//
//  Created by Juan Pablo on 9/19/17.
//  Copyright © 2017 Juan Pablo Fernandez. All rights reserved.
//

import Foundation
import Katana

struct DidTapCell: Action {
    
    var cellTitle: String
    var cellType: CellType
    
    func updatedState(currentState: State) -> State {
        guard var state = currentState as? ApplicationState else { fatalError("Invalid state") }
        
        let cellTitle = self.cellTitle
        let cellType = self.cellType

        if state.canClear {
            state.result = ""
            state.canClear = false
        }
        
        switch cellType {
        case .operation:
            if state.hasOperation {
                return state
            }
            
            state.operation = CalculatorUtils.getOperationFor(stringOperation: cellTitle)
            state.isFirstNumber = false
            state.hasOperation = true
            
            state.result = "\(state.result) \(state.operation!.rawValue) "
            break
            
        case .equal:
            
            state.isFirstNumber = true
            state.hasOperation = false
            state.canClear = true
            
            let result = CalculatorUtils.calculate(operation: state.operation!, firstNumber: Double(state.firstNumber)!, secondNumber: Double(state.secondNumber)!)
            
            state.result = String(result)
            break
            
        case .digit:
            if state.isFirstNumber {
                print(state.firstNumber)
                print(cellTitle)
                print(Double("\(state.firstNumber)\(cellTitle)")!)
                state.firstNumber = "\(state.firstNumber)\(cellTitle)"
                print(state.firstNumber)

            } else {
                state.secondNumber = "\(state.secondNumber)\(cellTitle)"
            }
            
            state.result = "\(state.result)\(cellTitle)"
            break
            
        case .extra:
            let newState = ApplicationState()
            return newState
        }
        
        
        
        return state
    }
}
