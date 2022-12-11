//
//  RPNConverter.swift
//  SwiftMathExpression
//
//  Created by Elina Semenko on 11.12.2022.
//

import Foundation

class RPNConverter {
    private var expression: String
    
    init(_ expression: String) {
        self.expression = expression
    }
    
    func convert() throws -> [String] {
        var output: [String] = []
        var stack = Stack<String>()
        let tokens = expression.components(separatedBy: " ")
        
        // for each token:
        for token in tokens {
            // token is an operator
            if MathExpression.operators.contains(operation: token) {
                while !stack.isEmpty && MathExpression.operators.contains(operation: stack.peek()) {
                    // while there is an operator on top of the stack and it has lower precedence than current operator (token)
                    // pop it to the output
                    guard let currentOperator = MathExpression.operators[token] else { throw EvaluationError.IllegalOperator } // current operator
                    guard let topOperator = MathExpression.operators[stack.peek()] else { throw EvaluationError.IllegalOperator } // top operator from the stack
                    
                    if  (currentOperator <= topOperator && currentOperator.associativity == .left) ||
                            (currentOperator < topOperator && currentOperator.associativity == .right)
                    {
                        output.append(stack.pop())
                        continue
                    }
                    break
                }
                
                // push the new operator to the stack
                stack.push(token)
                
            } else if MathExpression.functions.contains(function: token) {
                // token is a function
                stack.push(token)
            } else if token == "(" {
                // if token is left parenthesis, then push it to the stack
                
                stack.push(token)
                
            } else if ")" == token {
                // if the token is right parenthesis
                
                // until the top token (from the stack) is left parenthesis
                while !stack.isEmpty && !(stack.peek() == "(") {
                    // pop from the stack to the output
                    output.append(stack.pop())
                }
                
                // if the stack runs out, than there are mismatched parentheses.
                if stack.isEmpty {
                    throw EvaluationError.MismatchedParenthesis
                }
                
                // pop the left parenthesis but don't include it in the output
                _ = stack.pop()
                
                // if there is a function token at the top of the operator stack
                // pop the function from the operator stack into the output queue
                if !stack.isEmpty && MathExpression.functions.contains(function: stack.peek()) {
                    output.append(stack.pop())
                }

                
            } else {
                // token is not an operator or function, add it to the output
                output.append(token)
            }
        }
        
        while !stack.isEmpty {
            // While there are still operator tokens in the stack, pop them to output
            output.append(stack.pop())
        }
        
        return output
    }

}
