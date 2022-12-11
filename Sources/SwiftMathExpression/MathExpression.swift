//
//  MathExpression.swift
//  SwiftMathExpression
//
//  Created by Elina Semenko on 11.12.2022.
//

import Foundation

public class MathExpression {
    
    static let operators = [
        Operator("+", 0, .left),
        Operator("-", 0, .left),
        Operator("*", 1, .left),
        Operator("/", 1, .left),
        Operator("^", 2, .right)
    ]
    
    static let functions = [
        Function(value: "sin", parameters: 1),
        Function(value: "max", parameters: 2)
    ]
    
    public enum ExpressionStatus {
        case awaiting
        case success
        case error
    }
    
    public private(set) var status: ExpressionStatus
    public private(set) var value: String
    
    public init(_ expression: String) {
        self.value = expression
        self.status = .awaiting
    }
    
    func evaluate() throws -> Double {
        return try RPNService.evaluate(value)
    }
    
    func updateStatus(to status: ExpressionStatus) {
        self.status = status
    }
    
}
