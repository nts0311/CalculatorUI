//
//  RoundButton.swift
//  CalculatorUI
//
//  Created by son on 26/07/2022.
//

import SwiftUI

struct RoundButton: View {
    var key: Key
    var action: ((String) -> Void)? = nil
    
    var body: some View {
        RoundedRectangle(cornerRadius: 200)
            .foregroundColor(key.color)
            .overlay {
                Text(key.title)
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                
            }
            .onTapGesture {
                action?(key.title)
            }
    }
}

struct RoundButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundButton(key: Key(title: "1", color: .red))
            .frame(width: 90, height: 90, alignment: .center)
    }
}
