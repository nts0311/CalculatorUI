//
//  ContentView.swift
//  CalculatorUI
//
//  Created by son on 26/07/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var workingText: String = ""
    @State private var resultText: String = "0"
    
    private var calculator = Calculator()
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Text(workingText)
                    .font(.system(size: 30))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .foregroundColor(.gray)
                
                Text(resultText)
                    .font(.system(size: 50))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .foregroundColor(.white)
            }
            
            
            KeyPadView() {str in
                switch (str) {
                case "AC":
                    self.acTapped()
                case "=":
                    self.equalTapped()
                case "D":
                    self.deleteTapped()
                default:
                    self.workingText.append(str)
                }
            }
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            
        }.background(Color.black)
        
    }
    
    private func acTapped() {
        self.workingText = ""
        self.resultText = "0"
    }
    
    private func deleteTapped() {
        if(!self.workingText.isEmpty) {
            self.workingText.removeLast()
        }
    }
    
    private func equalTapped() {
        self.resultText = self.calculator.evaluateExpression(workingText: self.workingText)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
