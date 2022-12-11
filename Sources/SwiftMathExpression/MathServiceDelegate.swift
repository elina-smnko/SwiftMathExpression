//
//  MathServiceDelegate.swift
//  SwiftMathExpression
//
//  Created by Elina Semenko on 11.12.2022.
//

import Foundation

public protocol MathServiceDelegate: AnyObject {
    
    func mathService(_ service: MathService, didFinishEvaluatingExpression expression: MathExpression, withError error: Error)
    
    func mathService(_ service: MathService, didFinishEvaluatingExpression expression: MathExpression, withResult result: Double)
    
}
