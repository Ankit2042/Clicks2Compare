//
//  CreatLeadFornfield.swift
//  clicks2compare
//
//  Created by Nitin Singh on 02/01/24.
//

import SwiftUI

struct PhoneNumberWithCode: View {
    @Binding var PhoneNumber: String
    @State private var CountryFlag: String = "🇦🇪"
   @Binding var CountryDialcode: String
    @State private var presentCountrySheet : Bool = false
    @State private var searchText : String = ""
    var required: Bool
    var label: String
    var body: some View {
      
            
//            let homeIndicator = geo.safeAreaInsets.bottom > 0
            
            
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
                    HStack{
                        Button{
                            presentCountrySheet = true
                        } label: {
                            Text("\(CountryFlag) \(CountryDialcode)")
                                .foregroundColor(Color.black)
                                
                        }
                        
                        TextField("Phone Number", text: $PhoneNumber)
                                            .foregroundColor(Color.black)
                                            .keyboardType(.numberPad)
                            
                        
                    }
                    .padding(.horizontal)
                    .padding(.vertical,10)
                    .frame(maxWidth: .infinity)
                    .background(Color(#colorLiteral(red: 0.8509803922, green: 0.8431372549, blue: 0.8549019608, alpha: 1)))
                    .cornerRadius(10)
                    .overlay(
                            RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(#colorLiteral(red: 0.02745098039, green: 0.1803921569, blue: 0.4078431373, alpha: 1)), lineWidth: 1)
                        )
                    
                    
        
               
                
            }
            
            .sheet(isPresented: $presentCountrySheet){
                NavigationView{
                    List(Allcountries) { model in
                        HStack{
                            Text(model.flag)
                            Text(model.name)
                                .font(.body)
                            Spacer()
                            Text(model.dial_code)
                                .foregroundColor(Color(.systemGray2))
                        }
                        .onTapGesture {
                            self.CountryFlag = model.flag
                            self.CountryDialcode = model.dial_code
                            self.presentCountrySheet = false
                            self.searchText = ""
                        }
                    }
                }
                .searchable(text: $searchText, prompt: "Search Your Coutry")
            }
            
            
        
    }
    
    private var Allcountries : [CPData] {
            if self.searchText.isEmpty {
                return CPData.allCountries
            }else {
                return CPData.allCountries.filter {
                    $0.name.contains(self.searchText)
                    
                }
               
        }
    }
    
}
