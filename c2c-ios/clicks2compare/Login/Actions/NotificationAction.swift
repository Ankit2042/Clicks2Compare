//
//  NotificationAction.swift
//  clicks2compare
//
//  Created by user257152 on 2/6/24.
//

import Foundation



struct NotificationAction{
    let helper = Helper()
    
    func GetNotification(completion: @escaping (NotificationResponse) -> Void) {
        
        let constant  = Constant()
        print("Calling GetNotification")
        let mytoken: String = "Bearer \(helper.readTextFile() ?? "empty")"
        guard let url = URL(string: constant.BASE_UTL+""+constant.NOTIFICATION) else { return }
        print(mytoken)
        print(url)
        
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
                let response = try JSONDecoder().decode(NotificationResponse.self, from: data)
                // Access user profile data
                
                if response.code == 200 {
                    print("Success", response.message)
                    
                    completion(response)
                }else if response.code == 403 {
                    print("Error", response.message)
                  
                    completion(response)
                }
                
                print(response)
               
                completion(response)
                
                // ... Access other profile properties as needed
                
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
    
}
