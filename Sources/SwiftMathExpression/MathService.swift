//
//  MathService.swift
//  SwiftMathExpression
//
//  Created by Elina Semenko on 11.12.2022.
//

import Foundation

public class MathService {
    
    public weak var delegate: MathServiceDelegate?
    
    public private(set) var expressions: [MathExpression] = []
    public private(set) var results: [Double?] = []
    
    public init() { }
    
    public func append(expression: MathExpression) {
        expressions.append(expression)
    }
    
    public func append(expression: String) {
        let mathExpression = MathExpression(expression)
        expressions.append(mathExpression)
    }
    
    public func evaluate(expression: MathExpression) {
        append(expression: expression)
        do {
            let result = try expression.evaluate()
            delegate?.mathService(self, didFinishEvaluatingExpression: expression, withResult: result)
            results.append(result)
            expressions.last?.updateStatus(to: .success)
        } catch {
            delegate?.mathService(self, didFinishEvaluatingExpression: expression, withError: error)
            results.append(nil)
            expressions.last?.updateStatus(to: .error)
        }
    }
    
    public func evaluate(expression: String) {
        let mathExpression = MathExpression(expression)
        append(expression: mathExpression)
        do {
            let result = try mathExpression.evaluate()
            delegate?.mathService(self, didFinishEvaluatingExpression: mathExpression, withResult: result)
            results.append(result)
            expressions.last?.updateStatus(to: .success)
        } catch {
            delegate?.mathService(self, didFinishEvaluatingExpression: mathExpression, withError: error)
            results.append(nil)
            expressions.last?.updateStatus(to: .error)
        }
    }
    
    public func evaluate() {
        for expression in expressions {
              if expression.status == .awaiting {
                evaluate(expression: expression)
            }
        }
    }
    
}
