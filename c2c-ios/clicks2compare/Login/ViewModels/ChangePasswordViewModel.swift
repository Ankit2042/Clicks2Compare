//
//  ChangePasswordViewModel.swift
//  clicks2compare
//
//  Created by Nitin Singh on 28/12/23.
//

import Foundation


class ChangePasswordViewModel : ObservableObject {
    @Published var CurrentPassword: String = ""
    @Published var Password: String = ""
    @Published var CanfrimPassword: String = ""
    @Published var errorMessage : String = ""
    @Published var isPresentingErrorAlert: Bool = false
    @Published var isProgressView: Bool = false
    
    func changePassword() {
        let changePassword = ChangePasswordAction(parameters: ChangePasswordRequest(currentPassword: CurrentPassword, password: Password, passwordConfirmation: CanfrimPassword))
        
        
        changePassword.ChangePassword { result in
            self.isProgressView = true
           
            DispatchQueue.main.async {
                if(result.status == "success"){
                   
                    self.errorMessage = result.message.success?.joined(separator: " , ") ?? ""
                    self.isPresentingErrorAlert = true
                    self.isProgressView = false
                }else if (result.status == "notmatch"){
                    
                    self.errorMessage = result.message.error?.joined(separator: " , ") ?? ""
                    self.isPresentingErrorAlert = true
                    self.isProgressView = false
                }else{
                    self.errorMessage = result.message.error?.joined(separator: " , ") ?? ""
                    self.isPresentingErrorAlert = true
                    self.isProgressView = false
                    
                }
            }
            
        }
    }
    
}
