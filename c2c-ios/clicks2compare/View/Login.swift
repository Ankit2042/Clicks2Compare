//
//  Login.swift
//  clicks2compare
//
//  Created by Nitin Singh on 02/12/23.
//

import SwiftUI

struct Login: View {
    
    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()
    
    @Environment(\.sizeCategory) var sizeCategory
    let helper = Helper()
    
    @State var SwitchSingUp: Bool = false
    
    
    var body: some View {
       
        
        ZStack {
            VStack(spacing: 0){
                    
                            // MARK: Header
                    
                            ZStack{
                                Image("top_background")
                                    .resizable()
                                    .scaledToFit()
                                
                                
                                HStack{

                                    VStack(alignment: .leading) {
                                        Text("Hi,")
                                            .font(.system(size: 30).bold())
                                            .foregroundColor(.white)
                                            .lineLimit(1)
                                            .minimumScaleFactor(sizeCategory.customMinScaleFactor)
                                            
                                           
                                        
                                        Text("Please Login")
                                            .font(.system(size: 30).bold())
                                            .lineLimit(1)
                                            .minimumScaleFactor(sizeCategory.customMinScaleFactor)
                                            .foregroundColor(.white)
                                           
                                          
                                    }
                                    .padding(.top,-15)
                                    .padding(.leading, 15)
                                    
                                    
                                    Spacer()
                                }
                                
                                
                            }
                    
                    
                   
                
                    
                            
                ScrollView {
                    
                    CenterImage(light: Image("logo"), dark: Image("whitelogo"))
                                
                                // MARK: TextField
                    VStack{
                                    
                                    customTextfFld(label: "Email", PlaceHolder: "Enter Your Email", required: true, secure: false, bVariable: $viewModel.email)
                                                            .autocapitalization(.none)
                                    
                                    SecureInputView(title: "", text: $viewModel.password, PlaceHolder: "Enter Your Password", label: "Password", required: true)
                                    
                                  
                                    
            //                        MARK: Login Button
                                    
                                    Button {
                                        if (viewModel.validateInputs()){
                                            viewModel.authenticateUser()
                                            
                                        }
                                    } label: {
                                        
                                        Text("Login")
                                            .padding(.vertical,10)
                                            .frame(maxWidth: .infinity)
                                            .background(Color.theme.buttonColor.cornerRadius(10))
                                            .foregroundColor(.white)
                                            .font(.system(size: 25).bold())
                                        
                                    }
                                    
                                    
                                   
            //
                                    NavigationLink(
                                        destination: BottomBar(index: 0),
                                        isActive: $viewModel.navigated,
                                        label: {
                                            EmptyView()
                                        }
                                    )
                                    .isDetailLink(false)
                                    .alert(isPresented: $viewModel.isPresentingErrorAlert) {
                                        Alert(title: Text("Alert"), message: Text(viewModel.errorMessage), dismissButton: .default(Text("OK")))
                                    }
                                    
                                    
                                    HStack(spacing:5){
                                        Text("Don't remember Password?")
                                        NavigationLink {
                                            PasswordEmail()
                                        } label: {
                                            HStack{
                                                Text("Recovery it")
                                                    .foregroundColor(Color.theme.loginTextColor)
                                            }
                                            
                                            
                                    }
                                    }
                                    .padding(.top, 10)
                                    .lineLimit(2)
                                    .minimumScaleFactor(sizeCategory.customMinScaleFactor)
                                    
                                    
                                    
                                    HStack(spacing:5){
                                        Text("Don't have an account?")
                                        NavigationLink {
                                            SingUp1()
                                        } label: {
                                            HStack{
                                                Text("SignUp")
                                                    .foregroundColor(Color.theme.loginTextColor)
                                                    
                                                    
                                            }
                                            
                                            
                                    }
                                        
                                        
                                    }
                                    .padding(.top,10)
                                    .lineLimit(1)
                                    .minimumScaleFactor(sizeCategory.customMinScaleFactor)
                                     
                                }
                    .padding(.horizontal, 30)
                }
                            
                            
                            
                            Spacer()
                            
                      
                        
            }
            .navigationBarBackButtonHidden()
            
            if viewModel.isProgressView {
                HUDProgressView(placeHolder: "Please Wait", show: $viewModel.isProgressView)
                       }
        }
        .ignoresSafeArea()
    
    }
    
}





struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
            
    }
}







