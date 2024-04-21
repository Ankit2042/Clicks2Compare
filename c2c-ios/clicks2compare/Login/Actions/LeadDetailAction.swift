//
//  LeadDetailAction.swift
//  clicks2compare
//
//  Created by Nitin Singh on 11/01/24.
//

import Foundation



struct LeadDetailAction {
    let helper = Helper()
    var parameters: LeadDetailRequest
    
    func LeadDetail(completion: @escaping (LeadDetailResponse) -> Void) {
        let mytoken: String = "Bearer \(helper.readTextFile() ?? "empty")"
        print(mytoken)
        let constant  = Constant()
        print(parameters.leadId)
        print("BASE URL............  ",constant.BASE_UTL, " , EndPoint URL.........", constant.LEAD_DETAILS)
        
        let url = URL(string: constant.BASE_UTL+""+constant.LEAD_DETAILS)!
        
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
                let response = try? JSONDecoder().decode(LeadDetailResponse.self, from: data)
                
                if let response = response {
                   
                    print(response.code)
                    if response.code == 200 {
                        
                        if response.status == "success" {
                            completion(response)
                            print(response)
                            print(response.message)
                        }
                        
                        
                    }else if response.code == 403{
                        
                        if response.status == "unauthorized"{
                            print("invalid request...........")
                            completion(response)
                            
                        }else{
                            print("Error")
                        }
                        
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
