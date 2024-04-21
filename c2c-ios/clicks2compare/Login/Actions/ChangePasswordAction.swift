//
//  ChangePasswordAction.swift
//  clicks2compare
//
//  Created by Nitin Singh on 28/12/23.
//

import Foundation



struct ChangePasswordAction {
   
    var parameters: ChangePasswordRequest
    let helper = Helper()
    
    func ChangePassword(completion: @escaping (ChangePasswordResponse) -> Void) {
        

        let constant  = Constant()
        
        let mytoken: String = "Bearer \(helper.readTextFile() ?? "empty")"
        
        print("BASE URL............  ",constant.BASE_UTL, " , EndPoint URL.........", constant.USER_CHANGE_PASSWORD)
        
        let url = URL(string: constant.BASE_UTL+""+constant.USER_CHANGE_PASSWORD)!
        
        var request = URLRequest(url: url)
        request.httpMethod = "post"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue( mytoken, forHTTPHeaderField: "Authorization")
        
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
                let response = try? JSONDecoder().decode(ChangePasswordResponse.self, from: data)
                
                if let response = response {
                   
                    print(response.code)
                    if response.code == 200 {
                        
                        if response.status == "success"{
                            print("success", response.message)
                            completion(response)
                            
                        }else if response.status == "notmatch"{
                            print("error", response.message)
                           completion(response)
                        }else if response.status == "required"{
                            print("required ", response.message)
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
