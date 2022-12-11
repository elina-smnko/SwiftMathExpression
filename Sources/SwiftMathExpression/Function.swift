//
//  Function.swift
//  SwiftMathExpression
//
//  Created by Elina Semenko on 11.12.2022.
//

import Foundation

protocol FunctionType {
    var value: String { get }
    var parameters: Int { get }
}

struct Function: FunctionType {
    var value: String
    var parameters: Int
}

extension Array where Element: FunctionType {
    func contains(function: String?) -> Bool {
        guard let name = function else { return false }
        return contains { $0.value == name }
    }
    
    subscript (function: String) -> Element? {
        get {
            return filter { $0.value == function }.first
        }
    }
}
