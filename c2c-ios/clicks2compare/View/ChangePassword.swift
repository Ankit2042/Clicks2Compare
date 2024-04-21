//
//  ChangePassword.swift
//  clicks2compare
//
//  Created by Nitin Singh on 21/12/23.
//

import SwiftUI

struct ChangePassword: View {
    @ObservedObject var changePasswordViewModel = ChangePasswordViewModel()
   
    var body: some View {
        ZStack{
            VStack{
                Image(systemName: "lock.rotation.open")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.theme.blueWhite)
                .frame(width: 70, height: 70)
                .foregroundColor(Color(red: 0.03, green: 0.18, blue: 0.41))
                
                SecureInputView(title: "", text: $changePasswordViewModel.CurrentPassword, PlaceHolder: "Enter Current Password", label: "Current Password", required: true)
                
                SecureInputView(title: "", text: $changePasswordViewModel.Password, PlaceHolder: "New Password", label: "New Password", required: true)
                
                SecureInputView(title: "", text: $changePasswordViewModel.CanfrimPassword, PlaceHolder: "Confrim New Password", label: "Confirm New Password", required: true)
                
                Spacer()
                    .frame(height: 20)
                
                
                Button{
                    self.changePasswordViewModel.changePassword()
                    
                } label: {
                    HStack{
                        Text("Change Password")
                            .padding(.vertical,13)
                            .frame(maxWidth: .infinity)
                            .background(Color.theme.buttonColor.cornerRadius(10))
                            .foregroundColor(.white)
                            .font(.system(size: 20).bold())
                    }
                    
                }
               
                
                
                .alert(isPresented: $changePasswordViewModel.isPresentingErrorAlert) {
                    Alert(title: Text("Alert"), message: Text(changePasswordViewModel.errorMessage), dismissButton: .default(Text("OK")))
                }
                
                
                
            }
            .navigationTitle("Change Password")
            .padding(.horizontal,30)
            
            if changePasswordViewModel.isProgressView {
                HUDProgressView(placeHolder: "Please Wait", show: $changePasswordViewModel.isProgressView)
                       }
        }
        
    }
    
        
}

struct ChangePassword_Previews: PreviewProvider {
    static var previews: some View {
        ChangePassword()
    }
}
