//
//  ReferralUsers.swift
//  clicks2compare
//
//  Created by Nitin Singh on 05/01/24.
//

import SwiftUI



struct ReferralUsers_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}




struct Home : View {
//    @StateObject var referralUserDetail = ReferralUsersDetails()
    @StateObject var referralUsersDetail = ReferralUsersDetails()
    @State private var selectedRemark: String = "Total Lead"
    @State var  currentUserId: Int = 0
    var body: some View{
        ScrollView {
            VStack{
                
                
                VStack{
                        HStack{
                            LeadDeatails(bgColor: Color.theme.buttonColor, title: "Total Lead", currentStage: $selectedRemark, value: referralUsersDetail.referralUsers?.data.totalLeads ?? "0")
                            
                            LeadDeatails(bgColor: Color.theme.buttonColor, title: "In Progress", currentStage: $selectedRemark, value: referralUsersDetail.referralUsers?.data.totalInprogress ?? "0")
                            
                        }
                        
                    HStack{
                        LeadDeatails(bgColor: Color.theme.buttonColor, title: "Disbursed", currentStage: $selectedRemark, value: referralUsersDetail.referralUsers?.data.totalConverted ??  "0")
                        LeadDeatails(bgColor: Color.theme.buttonColor, title: "Logged In", currentStage: $selectedRemark, value: referralUsersDetail.referralUsers?.data.totalSubmitted ?? "0")
                        
                        LeadDeatails(bgColor: Color.theme.buttonColor, title: "Rejected", currentStage: $selectedRemark, value: referralUsersDetail.referralUsers?.data.totalRejected ?? "0")
                    }
                }
                .padding(.horizontal)
                
                VStack {
                        ForEach(filteredUsers(), id: \.self) { user in
                            let currentUserId = user.id ?? 0
                            Cardview(
                                serviceName: user.n1 ?? "",
                                customerName: user.customerName ?? "",
                                mobileNumber: user.phone ?? "",
                                remark: user.currentStage ?? "",
                                email: user.email ?? "",
                                isnavigate: $referralUsersDetail.isNavigate,
                                income: user.incomeOpportunity ?? "", id: currentUserId,
                                currentId: $currentUserId
                                
                            )
                        }
                        .background(
                            NavigationLink(
                                destination: LeadDetail(id: currentUserId),
                                isActive: $referralUsersDetail.isNavigate,
                                label: {
                                    EmptyView()
                                })
                                .onAppear {
                                    if referralUsersDetail.isNavigate {
                                        referralUsersDetail.isNavigate = false
                                    }
                                }
                        )
                    
                }
                
//                ReferralUsersList()
                
            }
           
        }
       
        
    }
    func filteredUsers() -> [ReferralUser] {
            if selectedRemark == "Total Lead" {
                // Show all users when "Total Lead" is selected
                return referralUsersDetail.referralUsers?.data.referralUsers ?? []
            } else {
                // Filter users based on the selected lead stage
                return referralUsersDetail.referralUsers?.data.referralUsers.filter { user in
                    return user.leadStage?.contains(selectedRemark) ?? false
                } ?? []
            }
        }
}


struct LeadDeatails : View {
    @State var bgColor: Color
    @State var title: String
    @Binding var currentStage: String
    var value: String
    var body: some View{
        ZStack{
            bgColor
            
            Button(action: {
                withAnimation(.interactiveSpring()){
                    currentStage = title
                }
                
            }, label: {
                HStack{
                    VStack(alignment: .leading, spacing: 22){
                        Text(title)
                            .foregroundColor(.white)
                        
                        Text("\(value)")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    
                    Spacer(minLength: 0)
                }
                .padding()
            })
            
        }
        .cornerRadius(10)
    }
}


