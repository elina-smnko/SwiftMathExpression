//
//  RPNEvaluator.swift
//  SwiftMathExpression
//
//  Created by Elina Semenko on 11.12.2022.
//

import Foundation

class RPNEvaluator {
    private var RPNtokens: [String]
    
    init(_ RPNtokens: [String]) {
        self.RPNtokens = RPNtokens
    }
    
    func evaluate() throws  -> Double {
        // Initialize the stack
        var stack = Stack<Double>()
        
        // iterating expression
        for token in RPNtokens {
            
            // token is an operand
            if !MathExpression.operators.contains(operation: token) && !MathExpression.functions.contains(function: token) {
                guard let doubleToken = Double(token) else {
                    throw EvaluationError.IllegalParamenter
                }
                stack.push(doubleToken)
            }
            
            else if MathExpression.functions.contains(function: token) {
                switch token {
                case "sin":
                    let operand = stack.pop()
                    stack.push(sin(operand))
                case "max":
                    let rightOperand = stack.pop()
                    let leftOperand = stack.pop()
                    stack.push(max(rightOperand, leftOperand))
                default:
                    throw EvaluationError.IllegalOperator
                }
            }
            
            // token is an operator
            else {
                // pop 2 operands from the stack
                let rightOperand = stack.pop()
                let leftOperand = stack.pop()
                
                // apply the operator to the operands
                // push the result to the stack
                switch token {
                case "+":
                    stack.push(leftOperand + rightOperand)
                case "-":
                    stack.push(leftOperand - rightOperand)
                case "*":
                    stack.push(leftOperand * rightOperand)
                case "/":
                    stack.push(leftOperand / rightOperand)
                case "^":
                    stack.push(pow(leftOperand, rightOperand))
                default:
                    throw EvaluationError.IllegalOperator
                }
            }
        }
        
        // pop the remaining value from the stack
        return stack.pop()
    }
}
