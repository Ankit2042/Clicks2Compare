//
//  DeshboardAction.swift
//  clicks2compare
//
//  Created by Nitin Singh on 22/12/23.
//

import Foundation
import SwiftUI


struct DeshboardAction{
    let helper = Helper()
    @AppStorage("loginToken") private var loginToken: String = ""
    func fetchUserProfile(completion: @escaping (DeshboardResponse) -> Void) {
        let constant  = Constant()
      print("Calling fetchUserProfile")
        let mytoken: String = "Bearer \(helper.readTextFile() ?? "empty")"
        guard let url = URL(string: constant.BASE_UTL+""+constant.DASHBOARD) else { return }
        print(mytoken)
        
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
                let response = try JSONDecoder().decode(DeshboardResponse.self, from: data)
                // Access user profile data
                print(response)
                print(response.id)
                
                completion(response)
                
                // ... Access other profile properties as needed
                
            } catch {
                loginToken = ""
                helper.cleanTokenData()
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
    
}
