//
//  ReferralUsersAction.swift
//  clicks2compare
//
//  Created by Nitin Singh on 05/01/24.
//

import Foundation


struct ReferralUsersAction{
    let helper = Helper()
    
    func ReferralUsers(completion: @escaping (ReferralUsersResponse) -> Void) {
      print("Calling ReferralUsers")
        let mytoken: String = "Bearer \(helper.readTextFile() ?? "empty")"
      
        
        let constant  = Constant()
        
      
        
        let url = URL(string: constant.BASE_UTL+""+constant.REFERRAL_USERS)!
      
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue( mytoken, forHTTPHeaderField: "Authorization")
        
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("No data received: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let response = try JSONDecoder().decode(ReferralUsersResponse.self, from: data)
                // Access user profile data
                print(response.data.totalLeads ?? 0)
                

                if response.code == 200 {
                    // Valid response, open the dashboard view
                    completion(response)
                } else {
                    // Invalid response, handle accordingly, e.g., show an error alert or navigate to the login view
                    print("Invalid response: ")
                    // Show error alert or navigate to the login view
                    
                }

                
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
    
}
