//
//  PasswordVerifyCodeAction.swift
//  clicks2compare
//
//  Created by Nitin Singh on 16/12/23.
//

import Foundation





struct PasswordVerifyCodeAction {
    
    var parameters: PasswordVerifyCodeRequest
    
    func OTPVerifyCode(completion: @escaping (PasswordVerifyCodeResponse) -> Void) {
        

        let constant  = Constant()
        
        print("BASE URL............  ",constant.BASE_UTL, " , EndPoint URL.........", constant.PASSWORD_VERIFY_CODE)
        
        let url = URL(string: constant.BASE_UTL+""+constant.PASSWORD_VERIFY_CODE)!
        
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
                let response = try? JSONDecoder().decode(PasswordVerifyCodeResponse.self, from: data)
            
                if let response = response {
                   
                    print("Code : ",response.code)
                    if response.code == 200 {
                       
                        if response.status == "ok"{
                            
                                print("Sucess massage ",response.message)
                                completion(response)
                            
                        }else if response.status == "requiredotp" {
                            
                            print("Error message", response.message)
                            completion(response)
                            
                        }else if response.status == "invalidtoken"{
                            completion(response)
                            print("invalid", response.message)
                        } else{
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
