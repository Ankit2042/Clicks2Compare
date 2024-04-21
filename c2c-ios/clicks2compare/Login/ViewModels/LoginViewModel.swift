//
//  LoginViewModel.swift
//  clicks2compare
//
//  Created by Nitin Singh on 29/11/23.
//

import Foundation
import SwiftUI



class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage : String = ""
    @Published var isPresentingErrorAlert: Bool = false
    @Published var navigated: Bool = false
    @Published var isProgressView: Bool = false
   
    private let loginValidation = LoginValidation()
    
    @AppStorage("loginToken") private var loginToken: String = ""
    
    
    func validateInputs() -> Bool {
        let result = loginValidation.validateUserInputs(email: email, password: password)
        if(result.success == false){
            errorMessage = result.errorMessage ?? "error occured"
            isPresentingErrorAlert = true
            return false
        }
        return true
    }

    
    func authenticateUser() {
        self.isProgressView = true
            let loginAction = LoginAction(parameters: LoginRequest(email: email, password: password))
            loginAction.UserLogin { result in
                
                DispatchQueue.main.async {
                    if(result.status == "success"){
                        self.loginToken = result.accessToken ?? ""
                        self.navigated = true
                        self.isProgressView = false
                    }else if (result.status == "invalid"){
                        self.errorMessage = result.message
                        self.isPresentingErrorAlert = true
                        self.isProgressView = false
                    }else{
                        self.errorMessage = result.message
                        self.isPresentingErrorAlert = true
                        self.isProgressView = false
                    }
                }
            }
        }

}
