//
//  SplashScreenView.swift
//  clicks2compare
//
//  Created by Nitin Singh on 16/01/24.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State private var isActive = false
    
    @State private var size = 2.9
    @State private var opacity = 0.5
    @Environment(\.colorScheme) var colorScheme
    let light: Image = Image("logo")
        let dark: Image = Image("whitelogo")
    
    @EnvironmentObject var appDelegate: AppDelegate
    var body: some View {
        
        if isActive {
            ContentView()
            
            NavigationLink(
                destination: BottomBar(index: 2),
                isActive: $appDelegate.notificationTapped,
                label: { EmptyView() }
            )
            .hidden()
        } else {
            VStack{
                VStack{
                    
                    Spacer()
                    
                    if colorScheme == .light {
                        light
                            .scaledToFit()
                            
                    } else {
                        dark
                            .scaledToFit()
                            
                    }
                   
                    Spacer()
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.4
                        self.opacity = 1.0
                    }
                }
                .onAppear {
                   
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        self.isActive = true
                    }
                }
            }
        }

    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
