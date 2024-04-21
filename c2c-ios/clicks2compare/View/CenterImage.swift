//
//  CanterImage.swift
//  clicks2compare
//
//  Created by user257152 on 1/31/24.
//

import SwiftUI

struct CenterImage: View {
    
    
    @Environment(\.colorScheme) var colorScheme
    let light: Image
        let dark: Image
    var body: some View {
        VStack{
//            Image("logo")
//                .resizable()
//                .scaledToFit()
//                .padding(.horizontal,50)
            
            if colorScheme == .light {
                light
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal,50)
            } else {
                dark
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal,50)
            }
    
           
        }
        
    }
}

//#Preview {
//    CenterImage(light: Image("logo"), dark: Image("whitelogo"))
//}
