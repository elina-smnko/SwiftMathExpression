//
//  RPNService.swift
//  SwiftMathExpression
//
//  Created by Elina Semenko on 11.12.2022.
//

import Foundation

class RPNService {
    private init() { }
    
    static func evaluate(_ expression: String) throws -> Double {
        let converter = RPNConverter(expression)
        let convertedExpression = try converter.convert()
        let evaluator = RPNEvaluator(convertedExpression)
        return try evaluator.evaluate()
    }
}
