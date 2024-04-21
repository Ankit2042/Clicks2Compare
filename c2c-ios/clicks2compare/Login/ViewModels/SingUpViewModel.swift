//
//  SingUpViewModel.swift
//  clicks2compare
//
//  Created by Nitin Singh on 09/12/23.
//

import Foundation
import SwiftUI


class SingUpViewModel: ObservableObject {
   
    @Published var OTPverify: Bool = false
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var refralphone: String = ""
    
    @Published var recommendedby: String = "Select Option"
    @Published var message : String = ""
    @Published var isPresentingErrorAlert: Bool = false
    @Published var navigate: Bool = false
    @ObservedObject var verifyViewModel: VerifyViewModel = VerifyViewModel()
    @Published var isProgressView: Bool = false
    
    private let singupValidation = SingUpValidation()
    
    
    
    
    func validateInputs() -> Bool {
        let result = singupValidation.SingUpInput(name: name, email: email, password: password, refralphone: refralphone, recommendedby: recommendedby)
        if(result.success == false){
            message = result.errorMessage ?? "error occured"
            isPresentingErrorAlert = true
            return false
        }
        return true
    }
    
    func SingUp() {
        self.isProgressView = true
        let singUpAction = SingUpAction(parameters: SingUpRequest(
            name: name,
            email: email,
            refralphone: refralphone,
            password: password,
            recommendedby: recommendedby,
            agree: true
        ))
        
        singUpAction.Register{ response in
            let errormessage = response.message.error?.joined(separator: " , ") ?? ""
           
            
            DispatchQueue.main.async {
                if(response.status == "created"){
                    self.OTPverify = true
                    self.verifyViewModel.refralphone = self.refralphone
                    self.isProgressView = false
                    
                }else if (response.status == "invalid"){
                    self.message = errormessage
                    self.isPresentingErrorAlert = true
                    self.isProgressView = false
                    
                }
            }
            
        }
    }
}


