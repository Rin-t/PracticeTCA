//
//  Multiplication.swift
//  PracticeTCA
//
//  Created by Rin on 2024/03/08.
//

import Foundation
import ComposableArchitecture

@Reducer
struct Multiplication {

    @ObservableState
    struct State: Equatable {
        var result: String?
    }

    enum Action: Equatable {
        case tappedCalculateButton(num1: String?, num2: String?, operation: ArithmeticOperation)
    }

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case let .tappedCalculateButton(num1, num2, operation):
                let num1 = Int(num1 ?? "")
                let num2 = Int(num2 ?? "")

                guard let num1,
                      let num2 else {
                    state.result = "数字を入力してください"
                    return .none
                }

                let calculationResult: String
                switch operation {
                case .addition:
                    calculationResult = String(num1 + num2)
                case .subtraction:
                    calculationResult = String(num1 - num2)
                case .multiplication:
                    calculationResult = String(num1 * num2)
                case .division:
                    if num2 == 0 {
                        state.result = "割る数には0以外を入力してください"
                        return .none
                    }
                    calculationResult = String(num1 / num2)
                }
                state.result = "結果: " + calculationResult

                return .none
            }
        }
    }
}
