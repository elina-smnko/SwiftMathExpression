//
//  Stack.swift
//  SwiftMathExpression
//
//  Created by Elina Semenko on 11.12.2022.
//

import Foundation

struct Stack<T> {
    private var items: [T] = []
    
    var isEmpty: Bool {
        items.isEmpty
    }
    
    func peek() -> T {
        guard let topElement = items.first else { fatalError("This stack is empty.") }
        return topElement
    }
    
    mutating func pop() -> T {
        return items.removeFirst()
    }
    
    mutating func push(_ element: T) {
        items.insert(element, at: 0)
    }
}
