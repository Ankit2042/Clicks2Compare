//
//  ReferralUsersViewModel.swift
//  clicks2compare
//
//  Created by Nitin Singh on 05/01/24.
//

import Foundation



class ReferralUsersDetails : ObservableObject {
    @Published var id: Int = 0
    @Published var referralUsers: ReferralUsersResponse?
    @Published var values: [Double] = []
    @Published var names: [String] = []
    @Published var isNavigate: Bool = false
   
    let referralAction = ReferralUsersAction()
    
    init(){
        self.GetData()
    }

    func GetData() {
        referralAction.ReferralUsers { response in
            
            DispatchQueue.main.async {
                self.referralUsers = response
                
                let names = response.data.piegraph.value?.compactMap(Double.init)
                    self.values = names ?? [] // Replace with data fetched from API
                self.names = response.data.piegraph.name ?? [] // Replace with data fetched from API
               
               
            }
        }
    }
    
}
