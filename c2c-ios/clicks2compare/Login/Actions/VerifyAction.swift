//
//  VerifyAction.swift
//  clicks2compare
//
//  Created by Nitin Singh on 12/12/23.
//

import Foundation



struct VerifyAction {
    
    var parameters: VerifyRequest
    
    func OTPVerify(completion: @escaping (VerifyResponse) -> Void) {
        

        let constant  = Constant()
        
        print("BASE URL............  ",constant.BASE_UTL, " , EndPoint URL.........", constant.VERIFY)
        
        let url = URL(string: constant.BASE_UTL+""+constant.VERIFY)!
        
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
                let response = try? JSONDecoder().decode(VerifyResponse.self, from: data)
            
                if let response = response {
                   
                    print("Code : ",response.code)
                    if response.code == 200 {
                       
                        if response.status == "created" {
                            completion(response)
                            print("Success message", response.message)
                           
                        }else if response.status == "invalidcode" {
                            completion(response)
                            print("error message", response.message)
                        }else{
                            print("invalid", response.message)
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
