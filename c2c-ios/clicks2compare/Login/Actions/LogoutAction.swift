//
//  LogoutAction.swift
//  clicks2compare
//
//  Created by Nitin Singh on 28/12/23.
//

import Foundation



struct LogoutAction{
    let helper = Helper()
    let constant = Constant()
    func LogOut(completion: @escaping (LogOutResponse) -> Void) {
      print("Calling LogOut")
        let mytoken: String = "Bearer \(helper.readTextFile() ?? "empty")"
        guard let url = URL(string: constant.BASE_UTL+""+constant.LOGOUT) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue( mytoken, forHTTPHeaderField: "Authorization")
        
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("No data received: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let response = try JSONDecoder().decode(LogOutResponse.self, from: data)
                // Access user profile data
                print(response)
                completion(response)
                self.helper.cleanTokenData()
               
              
                
                // ... Access other profile properties as needed
                
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
    
}
