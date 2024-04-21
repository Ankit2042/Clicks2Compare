//
//  LeadDetailViewModel.swift
//  clicks2compare
//
//  Created by Nitin Singh on 11/01/24.
//

import Foundation


class LeadDetailViewModel : ObservableObject {
    @Published var id: Int = 0
   
    @Published var leadDetail: LeadDetailResponse?
    
    
    
    
    
    func GetDetail() {
        print("\(self.id)")
        let leadDetailAction = LeadDetailAction(parameters: LeadDetailRequest(leadId: id))
        
        leadDetailAction.LeadDetail { response in
            print(response)
            DispatchQueue.main.async {
                self.leadDetail = response
            }
            
        }
    }
}
