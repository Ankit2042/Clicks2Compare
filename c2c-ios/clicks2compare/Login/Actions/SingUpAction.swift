//
//  SingUpAction.swift
//  clicks2compare
//
//  Created by Nitin Singh on 09/12/23.
//

import Foundation


struct SingUpAction {
    
    var parameters: SingUpRequest
    
    func Register(completion: @escaping (SingUpResponse) -> Void) {
        

        let constant  = Constant()
        
        print("BASE URL............  ",constant.BASE_UTL, " , EndPoint URL.........", constant.REGISTER)
        
        let url = URL(string: constant.BASE_UTL+""+constant.REGISTER)!
        
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
                let response = try? JSONDecoder().decode(SingUpResponse.self, from: data)
            
                if let response = response {
                   
                    print("Code : ",response.code)
                    if response.code == 200 {
                       
                        if response.status == "created"{
                           
                            completion(response)
                            print("Success message", response.message)
                            
                        }else if response.status == "invalid"{
                            completion(response)
                            print("error massage ",response.message)
                        }else{
                            print("Error")
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
