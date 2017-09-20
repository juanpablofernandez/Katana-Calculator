//
//  ApplicationState.swift
//  Katana Calculator
//
//  Created by Juan Pablo on 9/19/17.
//  Copyright © 2017 Juan Pablo Fernandez. All rights reserved.
//

import Foundation
import Katana

struct ApplicationState: State {

    var result: String
    var operation: Operation?
    var selectedDigit: Double?
    
    var firstNumber: String
    var secondNumber: String
    
    var isFirstNumber: Bool
    var hasOperation: Bool
    var canClear: Bool
    
    init() {
        self.result = "0"
        self.operation = nil
        self.selectedDigit = nil
        
        self.firstNumber = "0"
        self.secondNumber = "0"
        
        
        self.isFirstNumber = true
        self.hasOperation = false
        self.canClear = true
        
    }
}
