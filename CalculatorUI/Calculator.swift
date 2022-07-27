//
//  Calculator.swift
//  CalculatorUI
//
//  Created by son on 27/07/2022.
//

import Foundation
import SwiftUI

class Calculator {
    private func isSpecialCharacter(char: Character) -> Bool {
        if (char == "/" || char == "*" || char == "-" || char == "+" || char == ".") {
            return true
        }
        
        return false
    }
   
    private func validateInputs(workingText: String) -> Bool {
        if  workingText.isEmpty ||
            self.isSpecialCharacter(char: workingText.first ?? Character("")) ||
            self.isSpecialCharacter(char: workingText.last ?? Character("")){
            return false
        }
        
        for (i, char) in workingText.enumerated() {
            if (i > 0) {
                let indexBefore = workingText.index(workingText.startIndex, offsetBy: i-1)
                let beforeChar = workingText[indexBefore]
                if (isSpecialCharacter(char: char) && isSpecialCharacter(char: beforeChar)) {
                    return false
                }
            }
        }
        
        return true
    }
    
    func evaluateExpression(workingText: String) -> String {
        if self.validateInputs(workingText: workingText) {
            let checkedWorkingForPercent = workingText.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedWorkingForPercent)
            if let result = expression.expressionValue(with: nil, context: nil) as? Double {
                return String(result.formatted(FloatingPointFormatStyle()))
            } else {
                return "NaN"
            }
        } else {
            return "NaN"
        }
    }
}
