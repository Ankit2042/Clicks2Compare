//
//  CreateLeadViewModel.swift
//  clicks2compare
//
//  Created by Nitin Singh on 04/01/24.
//

import Foundation


class CreateLeadViewModel : ObservableObject {
    @Published var customerName: String = ""
    @Published var customerEmail: String = ""
    @Published var customerPhoneNo: String = ""
    @Published var customerPhoneCode: String = "+971"
    @Published var leadType: String = ""
    @Published var departmentId: String = ""
    @Published var comment: String = ""
    @Published var message : String = ""
    @Published var isPresentingErrorAlert: Bool = false
    @Published var navigate: Bool = false
    @Published var isSuccess: Bool = false
    @Published var recommendedBy: String = ""
    
    
    private let creatLeadValidation = CreateLeadValidation()
    
    
    func validateInputs() -> Bool {
       
        
        let result = creatLeadValidation.ValidLeadInput(customerName: customerName, email: customerEmail, customerPhoneNo: customerPhoneNo)
        if(result.success == false){
            message = result.errorMessage ?? "error occured"
            isPresentingErrorAlert = true
            return false
        }
        return true
    }
    
    
    func CreateLead() {
        let creatLeadAction = CreateLeadAction(parameters: CreateLeadRequest(customerName: customerName, customerEmail: customerEmail, customerPhoneNo: customerPhoneNo, customerPhoneCode: customerPhoneCode, leadType: leadType, departmentId: departmentId, comment: comment))
        
        creatLeadAction.CreateLead(){ response in
            let message = response.message.success?.joined(separator: " , ") ?? " "
            DispatchQueue.main.async {
                if response.status == "ok"{
                    
                    self.message  = message
                    self.isPresentingErrorAlert = true
                    self.isSuccess = true
                    
                }else if response.status == "required"{
                    self.message  = message
                    self.isPresentingErrorAlert = true
                }
            }
        }
    }
}
