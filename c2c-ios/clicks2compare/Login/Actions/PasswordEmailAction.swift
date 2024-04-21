//
//  PasswordEmailAction.swift
//  clicks2compare
//
//  Created by Nitin Singh on 16/12/23.
//

import Foundation
import SwiftUI


struct PasswordEmailAction {
    
   var parameters: PasswordEmailRequest
    
    func SendPasswordEmail(completion: @escaping (PasswordEmailResponse) -> Void) {
        

        let constant  = Constant()
        
        print("BASE URL............  ",constant.BASE_UTL, " , EndPoint URL.........", constant.PASSWORD_EMAIL)
        
        let url = URL(string: constant.BASE_UTL+""+constant.PASSWORD_EMAIL)!
       
        
        var request = URLRequest(url: url)
        request.httpMethod = "post"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
     
        do {
            request.httpBody = try JSONEncoder().encode(parameters)
          
        } catch {
            print("Unable to encode request parameters")
            // Error: Unable to encode request parameters
        }
        print("Call to URLSession Class.......")
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                let response = try? JSONDecoder().decode(PasswordEmailResponse.self, from: data)
         
                if let response = response{
                    
               
                    if response.code == 200 {
                        if response.status == "ok"{
                            
                            print("Success massage ", response.message)
                            completion(response)
                          
                            
                        }else if response.status == "invalidemail" {
                            print("Error massage invalidemail id ", response.message)
                            completion(response)
                        }else if response.status == "usernotfound" {
                            print("Error message usernotfound", response.message)
                            
                            completion(response)
                        } else{
                            print("Error ")
                        }
                    }else{
                        print("invalid request................")
                    }
                }else{
                    // Error: Unable to decode response JSON
                     print("Error: Unable to decode response JSON...................")
                }
            
            } else {
                // Error: API request failed
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
        task.resume()
    }
}

