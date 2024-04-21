//
//  BottomBar.swift
//  clicks2compare
//
//  Created by Nitin Singh on 04/12/23.
//

import SwiftUI

struct BottomBar: View {
    @State var ShowNewScreen: Bool = false
   @State var index: Int
    
   
    
    @State var selection: String = ""
    
   
    var body: some View {
        
        ZStack {
           
            VStack(spacing: 0) {
                
                
                        ZStack {
                            // Content Views
                            if self.index == 0 {
                                DashBoard()
                                Spacer().edgesIgnoringSafeArea(.top)
                            } else if self.index == 1 {
                                Home()

                            } else if self.index == 2 {
    //
                                NotificationView()
                                Spacer().edgesIgnoringSafeArea(.top)
                                    
                            } else if self.index == 3 {
                                Profile()
                                Spacer().edgesIgnoringSafeArea(.top)
                            }
                           
                        }
                       
                        
                   
                    customTabs(index: self.$index, ShowNewScreen: self.$ShowNewScreen)
                }
           
               
            .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden()
        }
        
        
       
    }
}

struct BottomBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomBar( index: 0)
    }
}

struct customTabs : View {
    
    @Binding var index : Int
    @Binding var ShowNewScreen: Bool
    @State private var rotationAngle: Double = 0.0
    @State var enlargeIt1 : Bool = false
    
    var body : some View{
        HStack(alignment: .bottom){
            Button(action: {
                self.index = 0
            }){
                VStack(spacing: 0){
                    
                    Image(systemName: "house.circle")
                        .font(self.index == 0 ? .system(size: 32) : .system(size: 27))
                        
                    Text("Home")
                        .font(.system(size: 15))
                }
                .foregroundColor(Color.theme.bottomButtonColor)
            }
            .tag(1)
            .opacity(self.index == 0 ? 1 : 0.5)
            
            Spacer(minLength: 0)
            
            Button(action: {
                self.index = 1
            }){
                VStack(spacing: 0){
                    Image(systemName: "person.crop.rectangle.stack")
                        .font(self.index == 1 ? .system(size: 30) : .system(size: 25))
                       
                    Text("Lead")
                        .font(.system(size: 15))
                }
                .foregroundColor(Color.theme.bottomButtonColor)
            }
            .opacity(self.index == 1 ? 1 : 0.5)
            
            Spacer(minLength: 0)
            
            
            
            Button(action: {
                self.index = 2
               
            }){
                VStack(spacing: 0){
                    Image(systemName: "bell.circle")
                        .font(self.index == 2 ? .system(size: 30) : .system(size: 28))
                       
                    Text("Notification")
                        .font(.system(size: 15))
                    
                }
                .foregroundColor(Color.theme.bottomButtonColor)
            }
            .opacity(self.index == 2 ? 1 : 0.5)
            
            Spacer(minLength: 0)
            
            Button(action: {
               
                    self.index = 3
                
                
            }){
                VStack(spacing: 0){
                    Image(systemName: "person.circle")
                        .font(self.index == 3 ? .system(size: 30) : .system(size: 25))
                        
                        
                        
                    Text("Account")
                        .font(.system(size: 15))
                        
                }
                .foregroundColor(Color.theme.bottomButtonColor)
            }
            .opacity(self.index == 3 ? 1 : 0.5)
        }
        .padding(.horizontal, 35)
        .padding(.top, 5)
        .background(Color.gray.opacity(0.2))
        
    }
}

