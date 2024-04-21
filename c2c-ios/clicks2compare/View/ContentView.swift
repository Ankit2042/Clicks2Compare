//
//  ContentView.swift
//  clicks2compare
//
//  Created by Nitin Singh on 27/11/23.
//

import SwiftUI

struct ContentView: View {
    let helper = Helper()
    
    @AppStorage("isFirstLaunch") private var isFirstLaunch: Bool = true
    @AppStorage("loginToken") private var loginToken: String = ""
    var body: some View {
        NavigationView{
            
            if isFirstLaunch {
                GetWelcome()
                
            } else {
                if loginToken == ""{
                    Login()
                    
                }else {
                    BottomBar(index: 0)
                }
            }
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
    
}

   


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
            
    }
}


