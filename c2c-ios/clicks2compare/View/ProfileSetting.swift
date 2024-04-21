//
//  ProfileSetting.swift
//  clicks2compare
//
//  Created by user257152 on 2/14/24.
//

import SwiftUI

struct ProfileSetting: View {
    
    @ObservedObject var profileSettingViewmodel : ProfileSettingViewModel = ProfileSettingViewModel()
    @State var navigate: Bool = false
    
    init(name: String, mobile: String, occupation: String, paymentMode: String, AccountNumber: String, iban: String, bankName: String,designation: String, email: String , recommendedBy: String){
        self.profileSettingViewmodel.name = name
        self.profileSettingViewmodel.referralPhone = mobile
        self.profileSettingViewmodel.occupation = occupation
        self.profileSettingViewmodel.paymentMode = paymentMode
        self.profileSettingViewmodel.bankAccountNumber = AccountNumber
        self.profileSettingViewmodel.iban = iban
        self.profileSettingViewmodel.bankName = bankName
        self.profileSettingViewmodel.designation = designation
        self.profileSettingViewmodel.email = email
        self.profileSettingViewmodel.recommendedBy = recommendedBy
    }
    var body: some View {
       
            ZStack{
                ScrollView {
                    VStack{
                        Group{
                            customTextfFld(label: "Full Name", PlaceHolder: "Full Name", required: false, secure: false, bVariable: $profileSettingViewmodel.name)
                                .disabled(true)
                            customTextfFld(label: "Email", PlaceHolder: "Enter Email", required: false, secure: false, bVariable: $profileSettingViewmodel.email)
                                .disabled(true)
                            customTextfFld(label: "Recommended By", PlaceHolder: "Recommended By", required: false, secure: false, bVariable: $profileSettingViewmodel.recommendedBy)
                                .disabled(true)
                            customTextfFld(label: "Mobile Number", PlaceHolder: "Mobile Number", required: false, secure: false, bVariable: $profileSettingViewmodel.referralPhone)
                                .disabled(true)
                        }
                        
                        Group{
                            customTextfFld(label: "Designation", PlaceHolder: "Designation", required: false, secure: false, bVariable: $profileSettingViewmodel.designation)
                            customTextfFld(label: "Occupation", PlaceHolder: "Occupation", required: false, secure: false, bVariable: $profileSettingViewmodel.occupation)
                            customTextfFld(label: "Payment Mode", PlaceHolder: "Payment Mode", required: false, secure: false, bVariable: $profileSettingViewmodel.paymentMode)
                            customTextfFld(label: "Account Number", PlaceHolder: "Account Number", required: false, secure: false, bVariable: $profileSettingViewmodel.bankAccountNumber)
                            customTextfFld(label: "IBAN", PlaceHolder: "Full Name", required: false, secure: false, bVariable: $profileSettingViewmodel.iban)
                            customTextfFld(label: "Bank Name", PlaceHolder: "Bank Name", required: false, secure: false, bVariable: $profileSettingViewmodel.bankName)
                            
                            Button(action: {
                                profileSettingViewmodel.EditProfile()
                            }, label: {
                                Text("Update Profile")
                                    .padding(.vertical,13)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.theme.buttonColor.cornerRadius(10))
                                    .foregroundColor(.white)
                                    .font(.system(size: 20).bold())
                            })
                            .alert(isPresented: $profileSettingViewmodel.isPresentingErrorAlert) {
                                if self.profileSettingViewmodel.isSuccess {
                                    return  Alert(title: Text("Message"), message: Text(self.profileSettingViewmodel.message), dismissButton: .default(Text("OK")){
                                        self.navigate = true
                                        
                                    })
                                } else {
                                    return  Alert(title: Text("Alert"), message: Text("Try Again"), dismissButton: .default(Text("OK")))
                                }
                            }
                            
                            
                            NavigationLink(
                                destination: BottomBar(index: 0),
                                isActive: $navigate,
                                label: {
                                    EmptyView()
                                })
                        }
                    }
                    .padding(.horizontal, 30)
                .navigationTitle("Edit Profile")
                }
                
                if profileSettingViewmodel.isPrograssView{
                    HUDProgressView(placeHolder: "Please Wait", show: $profileSettingViewmodel.isPrograssView)
                           }
            }
        
    }
}

//#Preview {
//    ProfileSetting(name: "String", mobile: "String", occupation: "sd", paymentMode: "String", AccountNumber: "String", iban: "String", bankName: "fr", designation: "ab", email: "acom", recommendedBy: "hfghd")
//}
