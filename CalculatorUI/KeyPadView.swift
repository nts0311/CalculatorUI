//
//  KeyPadView.swift
//  CalculatorUI
//
//  Created by son on 26/07/2022.
//

import SwiftUI

struct KeyPadView: View {
    
    var keyPressed: ((String) -> Void)? = nil
    
    let keyChar = [
        ["AC", "D", "%", "/"],
        ["7", "8", "9", "*"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["0", ".", "="]
    ]
    
    var keys:[[Key]] {
        var result:[[Key]] = []
        
        for (i, row) in keyChar.enumerated() {
            var resultRow: [Key] = []
            for (j, key) in row.enumerated() {
                var color: Color = (i == 0) ? .gray : Color(hex: 0x212121)
                if (j == row.count - 1) {
                    color = .orange
                }
                resultRow.append(Key(title: key, color: color))
            }
            
            result.append(resultRow)
        }
        
        return result
    }
    
    private let size = (UIScreen.main.bounds.width - 32) / 4 * 0.9
    
    var body: some View {
        VStack(spacing:16) {
            ForEach(0..<self.keys.count, id: \.self) {i in
                HStack() {
                    ForEach(0..<self.keys[i].count, id: \.self) {j in
                        let key = self.keys[i][j]
                        let width = (key.title == "0") ? size * 2 : size
                        RoundButton(key: Key(title: key.title, color: key.color)) {str in
                            self.keyPressed?(key.title)
                        }
                            .frame(width: width, height: size, alignment: .center)
                    }
                }
            }
        }
    }
}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

struct KeyPadView_Previews: PreviewProvider {
    static var previews: some View {
        KeyPadView()
    }
}
