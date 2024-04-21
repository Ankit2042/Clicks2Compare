//
//  Helper.swift
//  clicks2compare
//
//  Created by Nitin Singh on 22/12/23.
//

import Foundation


struct Helper{
    //  createFileInDocumentsDirectory for create text file Token.txt ans write the file
    
    func createFileInDocumentsDirectory(Content : String) {
        let fileName = "Token.txt" // Name of the file you want to create
        let fileContent = Content
        
       

        if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = documentDirectory.appendingPathComponent(fileName)
            
            do {
                try fileContent.write(to: fileURL, atomically: true, encoding: .utf8)
                
            } catch {
                print("Error creating file: \(error)")
            }
        }
    }


    // readTextFile() for read the Token.txt file

    func readTextFile() -> String? {
        let fileName = "Token.txt" // Name of the file you want to read

        if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = documentDirectory.appendingPathComponent(fileName)

            do {
                let fileContents = try String(contentsOf: fileURL, encoding: .utf8)

                return fileContents
            } catch {
                print("Error reading file: \(error)")
            }
        }
        return nil
    }
    
    
        
    func cleanTokenData() {
           createFileInDocumentsDirectory(Content: "")
           
       }
    

}

