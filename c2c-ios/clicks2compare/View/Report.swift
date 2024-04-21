//
//  Report.swift
//  clicks2compare
//
//  Created by user257152 on 2/8/24.
//

import SwiftUI

struct Report: View {
    @StateObject var referrajUsersDetail = ReferralUsersDetails()
    var body: some View {
        VStack{
            if let pieChartData = referrajUsersDetail.referralUsers {
               
                    PieChartView(values: referrajUsersDetail.values , names: pieChartData.data.piegraph.name ?? [], formatter: {value in String(format: "%.2f", value)})
                
            } else {
                ProgressView()
            }
        }
        .padding(.horizontal)
        
    }
}

//#Preview {
//    Report()
//}
