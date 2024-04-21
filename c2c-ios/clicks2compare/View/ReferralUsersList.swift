//
//  MyList.swift
//  clicks2compare
//
//  Created by Nitin Singh on 08/01/24.
//

import SwiftUI


struct Card: View {
    @State var isNavigate: Bool = false
    @State var id: Int = 0
    var body: some View {
        Cardview(serviceName: "SME Finance", customerName: "Ankit", mobileNumber: "7409358655", remark: "In Progress", email: "an1209454@gmail.com", isnavigate: $isNavigate, income: "15,000", id: 254, currentId: $id)
    }
}

//#Preview {
//    Card()
//}




struct Cardview : View {
     var serviceName: String
    var customerName: String
     var mobileNumber: String
    var remark: String
    var email: String
    @Binding var isnavigate: Bool
    var income: String
    var id: Int
    
    @Binding var currentId: Int
    @Environment(\.sizeCategory) var sizeCategory
    
    var body: some View{
        VStack{
            
            ZStack(){
               
                
                VStack(alignment: .leading){
                    
                    VStack(alignment: .leading) {
                        
                            Text(serviceName)
                                .font(.system(size: 25).weight(.semibold))
                                .foregroundColor(.primary)
                               
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                    
                    
                    VStack {
                        HStack{
                            VStack(alignment: .leading){
                             
                                Text("Name : ")
                                    .fontWeight(.medium)
                                
                                Text("Email : ")
                                    .fontWeight(.medium)
                                
                                Text("Mobile : ")
                                    .fontWeight(.medium)
                               
                                Text("Remark : ")
                                    .fontWeight(.medium)
                            }
                            .foregroundColor(.primary)
                            
                            VStack(alignment: .leading){
                                Text(customerName)
                                Text(email)
//                                    .scaledFont(name: "", size: 15)
                                    .lineLimit(1)
                                    .minimumScaleFactor(sizeCategory.customMinScaleFactor)
//                                    .tint(Color.primary)
                                    
                                Text(mobileNumber)
                                
                                Text(remark)
                            }
                        }
                        .foregroundColor(.primary)
                        
                       
                    }
                    .padding(.horizontal)
                    
                  
                       
                            
                            
                            HStack {
                                HStack(spacing: 0){
                                    Text("Income-")
                                        .font(.system(size: 15).weight(.semibold))
                                    Text(income)
                                        .font(.system(size: 15).weight(.semibold))
                                }
                                .foregroundColor(.black)
                                
                                Spacer(minLength: 5)
                                
                                Button(action: {
                                    isnavigate.toggle()
                                    self.currentId = id
                                }, label: {
                                    Text("Preview")
                                        .font(.system(size: 15).weight(.semibold))
                                        .foregroundColor(.white)
                                        .padding(.vertical,5)
                                        .padding(.horizontal, 30)
                                        .background(Color.theme.buttonColor)
                                        .cornerRadius(50)
                                })
                            }
                            .padding(.horizontal)
                            .padding(.vertical,10)
                        .background(
                            Rectangle()
                                .fill(Color(#colorLiteral(red: 0.9214347005, green: 0.9214347005, blue: 0.9214347005, alpha: 1)))
                                .cornerRadius(5)
                        )
                        .padding(.horizontal)
                  
                }
                .foregroundColor(.black)
                
            }
            .padding(10)
            .background(
                Rectangle()
                    .fill(Color.theme.liteBlackWhite)
                    .cornerRadius(15)
                    .shadow(radius: 2)
            )
            
        }
        .padding(.vertical, 10)
        .padding(.horizontal)
       
    }
}


@available(iOS 13, macCatalyst 13, tvOS 13, watchOS 6, *)
struct ScaledFont: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    var name: String
    var size: Double

    func body(content: Content) -> some View {
       let scaledSize = UIFontMetrics.default.scaledValue(for: size)
        return content.font(.custom(name, size: scaledSize))
    }
}

@available(iOS 13, macCatalyst 13, tvOS 13, watchOS 6, *)
extension View {
    func scaledFont(name: String, size: Double) -> some View {
        return self.modifier(ScaledFont(name: name, size: size))
    }
}
