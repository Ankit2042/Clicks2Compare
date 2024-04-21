//
//  Color.swift
//  clicks2compare
//
//  Created by Nitin Singh on 26/01/24.
//

import Foundation
import SwiftUI


extension Color {
    static let theme = ColorTheme()
    
}

struct ColorTheme {
    let buttonColor = Color("ButtonColor")
    let loginTextColor = Color("LoginTextColor")
    let blueWhite = Color("BlueWhite")
    let redWhite = Color("RedWhite")
    let liteBlackWhite = Color("LiteBlackwhite")
    let bottomButtonColor = Color("BottomButtonColor")
    let BlackWhite =  Color("BlackWhite")
}

extension Button {
    func customButtonStyle() -> some View {
        self
            .padding(.vertical,13)
                .frame(maxWidth: .infinity)
                .background(Color.theme.buttonColor.cornerRadius(10))
                .foregroundColor(.white)
                .font(.system(size: 27).bold())
    }
}
