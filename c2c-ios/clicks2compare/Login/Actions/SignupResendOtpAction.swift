//
//  LoginAction.swift
//  clicks2compare
//
//  Created by Nitin Singh on 29/11/23.
//

import Foundation
import SwiftUI


struct SignupResendOtpAction {
   
    var parameters: SignupResentOTPRequest
    
    func SentOTP(completion: @escaping (SignupResentOTPResponse) -> Void) {
        
      
        let constant  = Constant()
        
        print("BASE URL............  ",constant.BASE_UTL, " , EndPoint URL.........", constant.api_OTP)
        
        let url = URL(string: constant.BASE_UTL+""+constant.api_OTP)!
        print("URL",url)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
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
                let response = try? JSONDecoder().decode(SignupResentOTPResponse.self, from: data)
                print("Response",response as Any)
                if let response = response {
                   
                    print(response.code)
                    if response.code == 200 {
                        
                       print(response)
                        completion(response)
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
