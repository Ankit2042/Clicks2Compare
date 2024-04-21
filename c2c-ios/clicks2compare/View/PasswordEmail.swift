//
//  PasswordEmail.swift
//  clicks2compare
//
//  Created by Nitin Singh on 16/12/23.
//

import SwiftUI

struct PasswordEmail: View {
    
    @StateObject var passwordEmail: PasswordEmailViewModel = PasswordEmailViewModel()
   

    @State var isShowAlart: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                ZStack{
                    Image("top_background")
                        .resizable()
                        .scaledToFit()
                    
                    HStack{

                        VStack(alignment: .leading) {
                            Text("Forgot")
                                .font(.system(size: 30).bold())
                                .foregroundColor(.white)
                                
                                
                               
                            
                            Text("Password")
                                .font(.system(size: 30).bold())
                                .foregroundColor(.white)
                               
                              
                        }
                        .padding(.top,-15)
                        .padding(.leading, 15)
                        
                        
                        Spacer()
                    }
                    
                }
                
                
                
                VStack{
                    Image("forgot")
                        .padding()
                    
                   
                        
                   
                        Text("Enter your registered email below to receive password reset instruction")
                            .multilineTextAlignment(.center)
                  
                        
                    customTextfFld(label: "Email", PlaceHolder: "Enter Email", required: true, secure: false, bVariable: $passwordEmail.value)
                        .autocapitalization(.none)
                        
                        
                    Button {
                        if passwordEmail.ValidInput() {
                            self.passwordEmail.PasswordEmail()
                        }
                        
                    } label: {
                        HStack{
                            Text("Send")
                                .padding(.vertical,13)
                                .frame(maxWidth: .infinity)
                                .background(Color.theme.buttonColor.cornerRadius(10))
                                .foregroundColor(.white)
                                .font(.system(size: 20).bold())
                            
                            
                        }
                        
                    }
                    .alert(isPresented: $passwordEmail.isPresentingErrorAlert) {
                        if self.passwordEmail.issuccess {
                            return  Alert(title: Text("Message"), message: Text(self.passwordEmail.message), dismissButton: .default(Text("OK")){
    //                            self.passwordEmail.navigate = true
                            })
                        } else {
                            return  Alert(title: Text("Message"), message: Text(passwordEmail.message), dismissButton: .default(Text("OK")))
                        }
                    }
                         
                    HStack(spacing:5){
                       
                        NavigationLink {
                            Login()
                        } label: {
                            HStack{
                                Text("Back To Login")
                                    .foregroundColor(Color.theme.loginTextColor)
                            }
                            
                            
                        }
                    }
                    .padding(.top)
                        
                        
                        NavigationLink(
                            destination: PasswordVerifyCode(EmailID: self.passwordEmail.value),
                            isActive: self.$passwordEmail.SendOTP,
                            label: {
                                EmptyView()
                            }
                        )
                        .isDetailLink(false)
                            
                        
                        Spacer()
                        
                        
                    }
                .padding(.horizontal,30)
                .navigationBarBackButtonHidden()
            }
            
            if passwordEmail.isProgressView {
                HUDProgressView(placeHolder: "Please Wait", show: $passwordEmail.isProgressView)
                       }
            
        }
        .ignoresSafeArea()
    }
      
}

struct PasswordEmail_Previews: PreviewProvider {
    static var previews: some View {
        PasswordEmail()
    }
}


   
