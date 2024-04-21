//
//  RecommendedBy.swift
//  clicks2compare
//
//  Created by user257152 on 2/4/24.
//

import SwiftUI

//
//  CreatLeadFornfield.swift
//  clicks2compare
//
//  Created by Nitin Singh on 02/01/24.
//

import SwiftUI

struct RecommendedBy: View {
    @StateObject var recommendedBy = RecommendedViewModel()
    @Binding var Selected: String
    
    @State private var presentCountrySheet : Bool = false
    @State private var searchText : String = ""
    var label: String
    var required : Bool
    var body: some View {
        
        
        
        VStack(alignment: .leading, spacing: 3){
            HStack(spacing: 15){
                Text(label)
                    .font(.headline)
                    .offset(x:10)
                if required {
                    Text("*")
                        .foregroundColor(Color.red)
                }
            }
            
                
            VStack(alignment: .leading) {
                Button{
                        
                        presentCountrySheet = true
                        recommendedBy.fetchData()
                    } label: {
                        VStack(alignment: .leading) {
                            Text(Selected)
                                .foregroundColor(Color.black)
                                .padding(.horizontal)
                                .padding(.vertical,10)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color(#colorLiteral(red: 0.8509803922, green: 0.8431372549, blue: 0.8549019608, alpha: 1)))
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color(#colorLiteral(red: 0.02745098039, green: 0.1803921569, blue: 0.4078431373, alpha: 1)), lineWidth: 1)
                                )
                        }
                        

                            
                }
            }
                
            
           
            
            
        }
        .sheet(isPresented: $presentCountrySheet){
            NavigationView{
            List(searchResults, id: \.self) { model in
                HStack{
                    Text(model.name)
                }
                .onTapGesture {
                    self.Selected = model.name
                    self.presentCountrySheet = false
                    self.searchText = ""
                }
            }
            
        }
            .searchable(text: $searchText, prompt: "Recommended By")
            
        }
       }
    
    var searchResults: [Person] {
        if searchText.isEmpty {
            return recommendedBy.personList
               } else {
//                   return recommended.personList.filter { $0.contains(searchText) }
                   return recommendedBy.personList.filter {$0.name.contains(searchText)}
               }
        
    }
}


//#Preview {
//    showRecommended()
//}


struct showRecommended: View {
    @State var select: String = "select"
    var body: some View {
        RecommendedBy(Selected: $select, label: "Recommended", required: true)
    }
}
