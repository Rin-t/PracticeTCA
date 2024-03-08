//
//  ContentView.swift
//  PracticeTCA
//
//  Created by Rin on 2024/03/04.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {

    let store: StoreOf<Multiplication>

    @State private var selectedOperation = ArithmeticOperation.addition

    @State private var inputOfTextfield1 = ""
    @State private var inputOfTextfield2 = ""

    var body: some View {
        VStack {

            Picker("", selection: $selectedOperation) {
                ForEach(ArithmeticOperation.allCases) { operation in
                    Text(operation.operationText)
                        .tag(operation)
                }
            }
            .pickerStyle(.segmented)
            .frame(width: 240)

            TextField("数字を入力してください", text: $inputOfTextfield1)
                .textFieldStyle(.roundedBorder)
                .border(.black, width: 0.2)
                .padding(.vertical, 24)
                .frame(width: 200)

            TextField("数字を入力してください", text: $inputOfTextfield2)
                .textFieldStyle(.roundedBorder)
                .border(.black, width: 0.2)
                .padding(.bottom, 36)
                .frame(width: 200)

            Button("計算") {
                store.send(
                    .tappedCalculateButton(num1: inputOfTextfield1,
                                           num2: inputOfTextfield2,
                                           operation: selectedOperation)
                )
            }
            .padding(.bottom, 24)

            Text(store.state.result ?? "")
                .opacity(store.state.result == nil ? 0 : 1)
        }
        .padding()
    }
}

#Preview {
    ContentView(
        store: Store(initialState: Multiplication.State()) {
            Multiplication()}
    )
}
