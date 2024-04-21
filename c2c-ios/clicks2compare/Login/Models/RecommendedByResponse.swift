//
//  RecommendedByResponse.swift
//  clicks2compare
//
//  Created by user257152 on 2/4/24.
//

import Foundation



struct RecommendedByResponse: Decodable {
    let code: Int
    let status: String
    let message: RecommendedMessage
    let data: [Person]
}

struct RecommendedMessage: Decodable {
    let success: [String]
}

struct Person: Decodable, Hashable{
    
    let name: String
}



class RecommendedViewModel: ObservableObject {
    @Published var personList: [Person] = []
    @Published var recommendedByResponse: RecommendedByResponse?
    

   

    func fetchData() {
        // Assuming you have a function to fetch data from the API
        // Replace "yourApiFunction" with your actual API function
        guard let url = URL(string: "https://api.dextercrew.com/api/recommendedby") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) {data, response, error in
            let modelData = try? JSONDecoder().decode(RecommendedByResponse.self, from: data!)
          
            DispatchQueue.main.async {
                if let model = modelData{
                    self.recommendedByResponse = model
                    self.personList = model.data
                    print("model" ,model)
                }
            }
        }.resume()
    }
}
