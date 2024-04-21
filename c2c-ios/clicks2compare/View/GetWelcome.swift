//
//  Welcome.swift
//  clicks2compare
//
//  Created by user257152 on 2/1/24.
//

import SwiftUI

struct GetWelcome: View {
    @State var logIn: Bool = false
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
    var body: some View {
        VStack{
            Spacer()
            
            VStack {
                Gifimage("welcome")
                    .frame(maxWidth: .infinity, maxHeight: 400)
                    
                
                CenterImage(light: Image("logo"), dark: Image("whitelogo"))
            }
            
            
            VStack {
                Button(action: {
                    logIn.toggle()
                        isFirstLaunch = false
                }) {
                    HStack{
                        Text("Get Started")
                            .padding(.vertical,13)
                                .frame(maxWidth: .infinity)
                                .background(Color.theme.buttonColor.cornerRadius(10))
                                .foregroundColor(.white)
                                .font(.system(size: 20).bold())
                            
                    }
            }
            }
            .padding(.top)
            .padding(.horizontal, 30)
            
            Spacer()
            
           
            
            NavigationLink(
                destination: Login(),
                isActive: self.$logIn,
                label: {
                    EmptyView()
                }
            )
            .isDetailLink(false)
            

        }
        .ignoresSafeArea()
    }
}

//#Preview {
//    GetWelcome()
//}
