//
//  ProfileContant.swift
//  clicks2compare
//
//  Created by Nitin Singh on 27/12/23.
//

import SwiftUI

struct ProfileContant: View {
    @ObservedObject var deshboard = Deshboard()
    
    @State private var firstname = ""
    @State private var lastname = ""
    var body: some View {
      
            
        ZStack {
            Form {
                
                Section("Profile Photo"){
                    HStack(alignment: .center){
                        Spacer()
                        Image(systemName: "person.circle")
                            .resizable()
                            .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.blue, lineWidth: 2.0))

                        Spacer()
                    }
                }
                            
                
                Section(header: Text("Basic Information")) {
                    HStack {
                        Text("ID")
                        Spacer(minLength: 10)
                        if let userProfile = deshboard.userProfile {
                            Text("  \(userProfile.id)")
                        }
                    }
                    HStack {
                        Text("Full Name")
                        Spacer(minLength: 10)
                        Text(deshboard.userProfile?.name ?? " ")
                    }
                    HStack {
                        Text("Email")
                        Spacer(minLength: 10)
                        Text(deshboard.userProfile?.email ?? " ")
                    }
                    HStack {
                        Text("Recommended By")
                        Spacer(minLength: 10)
                        Text(deshboard.userProfile?.recommendedBy ?? " ")
                    }
                    HStack {
                        Text("Phone Number")
                        Spacer(minLength: 10)
                        Text(deshboard.userProfile?.referralPhone ?? " ")
                    }
                    HStack {
                        Text("Designation")
                        Spacer(minLength: 10)
                        Text(deshboard.userProfile?.designation ?? " ")
                    }
                    HStack {
                        Text("Occupation")
                        Spacer(minLength: 10)
                        Text(deshboard.userProfile?.occupation ?? " ")
                    }
                }
                
                Section("Bank Details"){
                    HStack {
                    Text("Payment Mode")
                    Spacer(minLength: 10)
                    Text(deshboard.userProfile?.paymentMode ?? " ")
                    }
                    HStack {
                    Text("Bank Name")
                    Spacer(minLength: 10)
                    Text(deshboard.userProfile?.bankName ?? " ")
                    }
                    HStack {
                    Text("Bank Account Number")
                    Spacer(minLength: 10)
                    Text(deshboard.userProfile?.bankAccountNumber ?? " ")
                    }
                    HStack {
                    Text("IBAN")
                    Spacer(minLength: 10)
                    Text(deshboard.userProfile?.iban ?? " ")
                    }
                }
                

                
                Section(header: Text("Edit Profile")) {
                    
                    NavigationLink {
                        ProfileSetting(
                            name: deshboard.userProfile?.name ?? "",
                            mobile: deshboard.userProfile?.referralPhone ?? "",
                            occupation: deshboard.userProfile?.occupation ?? "",
                            paymentMode: deshboard.userProfile?.paymentMode ?? "",
                            AccountNumber: deshboard.userProfile?.bankAccountNumber ?? "",
                            iban: deshboard.userProfile?.iban ?? "",
                            bankName: deshboard.userProfile?.bankName ?? "", designation: deshboard.userProfile?.designation ?? "",
                            email: deshboard.userProfile?.email ?? "", recommendedBy: deshboard.userProfile?.recommendedBy ?? ""
                        )
                    } label: {
                        Text("Edit Profile")
                            .padding(.vertical,13)
                                .frame(maxWidth: .infinity)
                                .background(Color.theme.buttonColor.cornerRadius(10))
                                .foregroundColor(.white)
                                .font(.system(size: 20).bold())
                    }

                }
                
                            
            }
            .navigationBarTitle(Text("Profile"))
           
        }
        
    }
}

struct ProfileContant_Previews: PreviewProvider {
    static var previews: some View {
        ProfileContant()
    }
}
