//
//  LeadDetail.swift
//  clicks2compare
//
//  Created by Nitin Singh on 11/01/24.
//

import SwiftUI

struct LeadDetail: View {
    @ObservedObject var leadDetailViewModel = LeadDetailViewModel()
    //    @ObservedObject  var userLeadDetail = LeadDetailViewModel()
    
    var id: Int
    
    init(id: Int){
        self.id = id
        self.leadDetailViewModel.id = id
    }
    
    var body: some View {
        
        Form{
//            MARK: Case Information
            
            Section(header: Text("Case Information")){
                
                HStack {
                    Text("Service")
                    Spacer(minLength: 10)
                    Text("\(leadDetailViewModel.leadDetail?.data.leadDetail.n1 ?? "")")
                }
                
                HStack {
                    Text("Customer Name")
                    Spacer(minLength: 10)
                    Text("\(leadDetailViewModel.leadDetail?.data.leadDetail.customerName ?? "")")
                }
                
                HStack {
                    Text("Email Id")
                    Spacer(minLength: 10)
                    Text("\(leadDetailViewModel.leadDetail?.data.leadDetail.email ?? "")")
                }
                
                HStack {
                    Text("Phone")
                    Spacer(minLength: 100)
                    Text("\(leadDetailViewModel.leadDetail?.data.leadDetail.phone ?? "")")
                }
                
                HStack {
                    Text("Comment")
                    Spacer(minLength: 10)
                    Text("\(leadDetailViewModel.leadDetail?.data.leadDetail.comment ?? "")")
                }
                
                HStack {
                    Text("Recommended By")
                    Spacer(minLength: 10)
                    Text("\(leadDetailViewModel.leadDetail?.data.leadDetail.leadGiveBy ?? "")")
                }
                
                HStack {
                    Text("Income Opportunity")
                    Spacer(minLength: 10)
                    Text("\(leadDetailViewModel.leadDetail?.data.leadDetail.incomeOpportunity ?? "")")
                }
                
                HStack {
                    Text("Current Stage")
                    Spacer(minLength: 10)
                    Text("\(leadDetailViewModel.leadDetail?.data.leadDetail.currentStage ?? "")")
                }
            }
            
            
//        MARK: TeamLeader
            Section(header: Text("Team Leader")){
                HStack {
                    Text("Team Leader")
                    Spacer(minLength: 10)
                    Text("\(leadDetailViewModel.leadDetail?.data.leadDetail.teamLeaderName ?? "")")
                }
                
                HStack {
                    Text("Email")
                    Spacer(minLength: 10)
                    Text("\(leadDetailViewModel.leadDetail?.data.leadDetail.email ?? "")")
                }
                
                HStack {
                    Text("Mobile")
                    Spacer(minLength: 10)
                    Text("\(leadDetailViewModel.leadDetail?.data.leadDetail.phone ?? "")")
                }
                
            }
            
//            MARK: Escalation
            Section(header: Text("Escalation")){
                HStack {
                    Text("Escalation")
                    Spacer(minLength: 10)
                    Text("\(leadDetailViewModel.leadDetail?.data.leadDetail.escalationName ?? "")")
                }
                
                HStack {
                    Text("Email")
                    Spacer(minLength: 10)
                    Text("\(leadDetailViewModel.leadDetail?.data.leadDetail.escalationEmail ?? "")")
                }
                
                HStack {
                    Text("Mobile")
                    Spacer(minLength: 10)
                    Text("\(leadDetailViewModel.leadDetail?.data.leadDetail.escalationMobile ?? "")")
                }
                
            }
            
            
//            MARK: Case Stages
            Section(header: Text("Case Stages")) {
                ForEach(0..<(leadDetailViewModel.leadDetail?.data.leadStages.name.count ?? 0), id: \.self) { index in
                     
                    HStack {
                        Text(leadDetailViewModel.leadDetail?.data.leadStages.name[index] ?? "")
                        Spacer()
                        CheckBoxView(checked: leadDetailViewModel.leadDetail?.data.leadStages.status[index] ?? "")
//                        Text(leadDetailViewModel.leadDetail?.data.leadStages.status[index] ?? "")
                    }
                    }
                
            }
            
        }
        .navigationTitle("Case Summary")
        .onAppear(){
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                leadDetailViewModel.GetDetail()
            }
        }
        
        
    }
}

struct LeadDetail_Previews: PreviewProvider {
    static var previews: some View {
        LeadDetail(id: 215)
    }
}
