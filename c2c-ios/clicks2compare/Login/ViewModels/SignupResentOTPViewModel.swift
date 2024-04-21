//
//  SignupResentOTPViewModel.swift
//  clicks2compare
//
//  Created by user257152 on 2/16/24.
//

import Foundation



class SignupResentOTPViewModel: ObservableObject {
    @Published var email: String = ""
    
    func SentOTP() {
        let signupResentOTPAction = SignupResendOtpAction(parameters: SignupResentOTPRequest(email: email))
        print(self.email)
        
        signupResentOTPAction.SentOTP{response in
                print(response)
        }
    }
}
