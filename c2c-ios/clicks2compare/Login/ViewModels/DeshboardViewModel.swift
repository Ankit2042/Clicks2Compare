//
//  DeshboardViewModel.swift
//  clicks2compare
//
//  Created by Nitin Singh on 26/12/23.
//

import Foundation

class Deshboard : ObservableObject {
    @Published var id: Int = 0
    @Published var userProfile: DeshboardResponse?
    @Published var isvalid: Bool = false
    let deshboardAction = DeshboardAction()
    
    init(){
        self.GetData()
    }

    func GetData() {
        deshboardAction.fetchUserProfile { response in
            DispatchQueue.main.async {
                self.userProfile = response
                self.id = response.id
                self.isvalid = true
            }
        }
    }
    
}
