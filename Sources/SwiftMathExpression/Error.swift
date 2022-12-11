//
//  Error.swift
//  SwiftMathExpression
//
//  Created by Elina Semenko on 11.12.2022.
//

import Foundation

enum EvaluationError: Error {
    case MismatchedParenthesis
    case IllegalOperator
    case IllegalParamenter
    case InvalidFunctionDeclaration
    case UnknownError
}

extension EvaluationError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .MismatchedParenthesis:
            return NSLocalizedString(
                "The provided expression is not valid.",
                comment: "Mismatched Parenthesis"
            )
        case .IllegalOperator:
            return NSLocalizedString(
                "The provided expression is not valid.",
                comment: "Illegal Operator"
            )
        case .IllegalParamenter:
            return NSLocalizedString(
                "The provided expression is not valid.",
                comment: "Illegal Paramenter"
            )
        case .InvalidFunctionDeclaration:
            return NSLocalizedString(
                "The provided expression is not valid.",
                comment: "Invalid Function Declarations"
            )
        case .UnknownError:
            return NSLocalizedString(
                "An unexpected error occured.",
                comment: "Unknown Error"
            )
        }
    }
}
