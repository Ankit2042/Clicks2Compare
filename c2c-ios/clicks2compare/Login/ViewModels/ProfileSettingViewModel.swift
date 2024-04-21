//
//  ProfileSettingViewModel.swift
//  clicks2compare
//
//  Created by user257152 on 2/14/24.
//

import Foundation


@MainActor class ProfileSettingViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var referralPhone: String = ""
    @Published var occupation: String = ""
    @Published var companyname: String = ""
    @Published var paymentMode: String = ""
    @Published var bankName: String = ""
    @Published var bankAccountNumber: String = ""
    @Published var iban: String = ""
    @Published var message : String = ""
    @Published var isPresentingErrorAlert: Bool = false
//    @Published var navigate: Bool = false
    @Published var isSuccess: Bool = false
    @Published var isPrograssView: Bool = false
    @Published var designation: String = ""
    @Published var email: String = ""
    @Published var recommendedBy = ""
    
    func EditProfile(){
        let profilesettingAction = ProfileSettingAction(parameters: ProfileSettingRequest(name: name, refralPhone: referralPhone, occupation: occupation, companyname: companyname, paymentMode: paymentMode, bankName: bankName, bankAccountNumber: bankAccountNumber, iban: iban, designation: designation, email: email, recommendedBy: recommendedBy))
        
        profilesettingAction.EditProfile{ response in
            print(response)
            self.isPrograssView = true
            DispatchQueue.main.async {
                if response.code == 200 {
                    self.isPrograssView = false
                    self.isPresentingErrorAlert = true
                    self.isSuccess = true
                    self.message = "Profile Update SuccessFully"
                    
                }
                
                if response.code == 403 {
                    self.isPrograssView = false
                    self.isPresentingErrorAlert = true
                    self.message = "Unauthenticated user"
                }
            }
            
        }
    }
    
    
}
