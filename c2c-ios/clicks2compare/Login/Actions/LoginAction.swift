//
//  LoginAction.swift
//  clicks2compare
//
//  Created by Nitin Singh on 29/11/23.
//

import Foundation
import SwiftUI


struct LoginAction {
   
    var parameters: LoginRequest
    
    func UserLogin(completion: @escaping (LoginResponse) -> Void) {
        
        let helper = Helper()
        let constant  = Constant()
        
        print("BASE URL............  ",constant.BASE_UTL, " , EndPoint URL.........", constant.LOGIN)
        
        let url = URL(string: constant.BASE_UTL+""+constant.LOGIN)!
        
        var request = URLRequest(url: url)
        request.httpMethod = "post"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            request.httpBody = try JSONEncoder().encode(parameters)
        } catch {
            print("Unable to encode request parameters")
           
              return
            // Error: Unable to encode request parameters
        }
        print("Call to URLSession Class.......")
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                let response = try? JSONDecoder().decode(LoginResponse.self, from: data)
                
                if let response = response {
                   
                    print(response.code)
                    if response.code == 200 {
                        
                        if response.status == "success"{
                            completion(response)
                            var constant2  = Constant()
                            if response.accessToken != nil{
                                
                                print(response.accessToken ?? " ")
                                print(response.data?.name ?? " ")
                                constant2.TOKEN = response.accessToken ?? ""
                                print("Constent2 \(constant2.TOKEN)")
                                
                                helper.createFileInDocumentsDirectory(Content: response.accessToken ?? "")
                                
                                
                            }
                        
                            
                        }else if response.status == "invalid"{
                            print("invalid", response.message)
                            
                            completion(response)
                            
                        }else{
                            print("error ", response.message)
                            completion(response)
                        }
                        
                    }else{
                        print("invalid request...........")
                    }
                } else {
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
