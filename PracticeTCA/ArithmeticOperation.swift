//
//  ArithmeticOperation.swift
//  PracticeTCA
//
//  Created by Rin on 2024/03/08.
//

import Foundation

enum ArithmeticOperation: CaseIterable, Identifiable {
    case addition
    case subtraction
    case multiplication
    case division

    var id: String { self.operationText }

    var operationText: String {
        switch self {
        case .addition: return "+"
        case .subtraction: return "-"
        case .multiplication: return "×"
        case .division: return "÷"
        }
    }
}
