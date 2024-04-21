//
//  ModelsData.swift
//  clicks2compare
//
//  Created by Nitin Singh on 13/01/24.
//

import Foundation


class YourViewModel: ObservableObject {
    @Published var yourData: YourResponseModel?

    init() {
        loadData()
    }

    func loadData() {
        if let fileURL = Bundle.main.url(forResource: "leadDetail", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileURL)
                let decodedData = try JSONDecoder().decode(YourResponseModel.self, from: data)
                self.yourData = decodedData
                print(decodedData)
            } catch {
                print("Error decoding JSON: \(error)")
            }
        } else {
            print("File not found")
        }
    }
}




// Replace with`Initialize here` Comment above

