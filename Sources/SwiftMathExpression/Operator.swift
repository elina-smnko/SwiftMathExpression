//
//  Operator.swift
//  SwiftMathExpression
//
//  Created by Elina Semenko on 11.12.2022.
//

import Foundation

protocol OperatorType: Comparable {
    var value: String { get }
    var precedence: Int { get }
    var associativity: Associativity { get }
}

struct Operator: OperatorType {
    let value: String
    let precedence: Int
    let associativity: Associativity
    
    init(_ value: String, _ precedence: Int, _ associativity: Associativity) {
        self.value = value
        self.precedence = precedence
        self.associativity = associativity
    }
    
    static func < (lhs: Operator, rhs: Operator) -> Bool {
        lhs.precedence < rhs.precedence
    }
}

extension Array where Element: OperatorType {
    func contains(operation: String?) -> Bool {
        guard let operatorName = operation else { return false }
        return contains { $0.value == operatorName }
    }
    
    subscript (operation: String) -> Element? {
        get {
            return filter { $0.value == operation }.first
        }
    }
}
