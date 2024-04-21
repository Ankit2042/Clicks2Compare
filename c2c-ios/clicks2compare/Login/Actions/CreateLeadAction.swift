//
//  CreateLeadAction.swift
//  clicks2compare
//
//  Created by Nitin Singh on 04/01/24.
//

import Foundation


struct CreateLeadAction {
    let helper = Helper()
    var parameters: CreateLeadRequest
    
    func CreateLead(completion: @escaping (CreateLeadResponse) -> Void) {
        let mytoken: String = "Bearer \(helper.readTextFile() ?? "empty")"

        let constant  = Constant()
        
        print("BASE URL............  ",constant.BASE_UTL, " , EndPoint URL.........", constant.CREATE_LEAD)
        
        let url = URL(string: constant.BASE_UTL+""+constant.CREATE_LEAD)!
        
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
                let response = try? JSONDecoder().decode(CreateLeadResponse.self, from: data)
                
                if let response = response {
                   
                    print(response.code)
                    if response.code == 200 {
                        
                        if response.status == "ok" {
                            completion(response)
                            print(response)
                            print(response.message)
                        }else if response.status == "required" {
                            print(response)
                            print(response.message)
                            completion(response)
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
