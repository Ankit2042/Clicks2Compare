//
//  ForgotPassword.swift
//  clicks2compare
//
//  Created by Nitin Singh on 05/12/23.
//

import SwiftUI

struct ForgotPass: View {
    
    @ObservedObject var forgotViewModel: ForgotViewModel = ForgotViewModel()
    
    init(Token: String, emailID: String) {
        self.forgotViewModel.token = Token
        self.forgotViewModel.email = emailID
        
    }
   
    var body: some View {
        
        ZStack {
            
            VStack{
                
                // MARK: Header
                ZStack(){
                    Image("top_background")
                        .resizable()
                        .scaledToFit()
                    
                    HStack{
                        
                        VStack(alignment: .leading) {
                            Text("Create")
                                .font(.system(size: 30).bold())
                                .foregroundColor(.white)
                                .lineLimit(1)
                                                           
                            
                            
                            Text("Password")
                                .font(.system(size: 30).bold())
                                .lineLimit(1)
                                .foregroundColor(.white)
                            
                            
                        }
                        .padding(.top,-15)
                        .padding(.leading, 15)
                        
                        
                        Spacer()
                    }
                    
                }
                
                
                
                
                
                VStack{
                    Image(systemName: "lock.rotation.open")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                        .foregroundColor(Color.theme.blueWhite)
                    
                    
                    Text("Your new password must be different from the previously used passwords ")
                        .multilineTextAlignment(.center)
                    
                    
                    SecureInputView(title: "", text: $forgotViewModel.password, PlaceHolder: "Password", label: "New Password", required: true)
                    
                    
                    SecureInputView(title: "", text: $forgotViewModel.passwordconfirmation, PlaceHolder: "Confirm Password", label: "Confirm New Password", required: true)
                    
                   
                    
                    Button{
                        if forgotViewModel.ValidInput() {
                            forgotViewModel.Forgot()
                        }
                    } label: {
                        Text("Create Password")
                            .padding(.vertical,13)
                            .frame(maxWidth: .infinity)
                            .background(Color.theme.buttonColor.cornerRadius(10))
                            .foregroundColor(.white)
                            .font(.system(size: 20).bold())
                    }
                    
                    .alert(isPresented: $forgotViewModel.isPresentingErrorAlert) {
                        if self.forgotViewModel.issuccess {
                            return  Alert(title: Text("Message"), message: Text(self.forgotViewModel.message), dismissButton: .default(Text("OK")){
                                self.forgotViewModel.navigate = true
                            })
                        } else {
                            return  Alert(title: Text("Message"), message: Text(forgotViewModel.message), dismissButton: .default(Text("OK")))
                        }
                    }
                    
                    
                    
                    NavigationLink(
                        destination: Login(),
                        isActive: $forgotViewModel.navigate,
                        label: {
                            EmptyView()
                        })
                    
                    Spacer()
                    
                }
                .padding(.horizontal,30)
                
                
                Spacer()
                
            }
            
            
            if forgotViewModel.isProgressView {
                HUDProgressView(placeHolder: "Please Wait", show: $forgotViewModel.isProgressView)
            }
            
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
        
        
    }
}

struct ForgotPass_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPass(Token: "token", emailID: "emailID")
    }
}
