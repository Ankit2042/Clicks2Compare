//
//  customTextfFld.swift
//  clicks2compare
//
//  Created by Nitin Singh on 02/12/23.
//

import SwiftUI

import SwiftUI

struct customTextfFld: View {
    var label: String
    var PlaceHolder : String
    var required : Bool
    var secure : Bool
    @Binding var bVariable : String
    
    
    
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
            
            if secure{
                HStack{
                    SecureField("", text: $bVariable, prompt: Text(PlaceHolder)
                    .foregroundColor(Color(#colorLiteral(red: 0.5215686275, green: 0.5137254902, blue: 0.5254901961, alpha: 1))))
                }
                .foregroundColor(.black)
                .padding(.horizontal)
                .padding(.vertical,10)
                .frame(maxWidth: .infinity)
                .background(Color(#colorLiteral(red: 0.8509803922, green: 0.8431372549, blue: 0.8549019608, alpha: 1)))
                .cornerRadius(10)
                .overlay(
                        RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(#colorLiteral(red: 0.02745098039, green: 0.1803921569, blue: 0.4078431373, alpha: 1)), lineWidth: 1)
                    )
                
                       
                   
            }else{
                TextField("", text: $bVariable, prompt: Text(PlaceHolder)
                    .foregroundColor(Color(#colorLiteral(red: 0.5215686275, green: 0.5137254902, blue: 0.5254901961, alpha: 1))))
                .foregroundColor(.black)
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
        }
        .padding([.bottom, .top] , 10)
    }
}



struct SecureInputView: View {
    
    @Binding private var text: String
    @State private var isSecured: Bool = true
    private var title: String
    var PlaceHolder : String
    var label: String
    var required : Bool
   
    init(title: String, text: Binding<String>, PlaceHolder: String,label: String, required: Bool) {
        self.title = title
        self._text = text
        self.PlaceHolder = PlaceHolder
        self.required = required
        self.label = label
       
    }
    
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
                HStack {
                    if isSecured {
                        SecureField("", text: $text, prompt: Text(PlaceHolder)
                        .foregroundColor(Color(#colorLiteral(red: 0.5215686275, green: 0.5137254902, blue: 0.5254901961, alpha: 1))))
                        .foregroundColor(.black)
                        
                    } else {
                        TextField("", text: $text, prompt: Text(PlaceHolder)
                            .foregroundColor(Color(#colorLiteral(red: 0.5215686275, green: 0.5137254902, blue: 0.5254901961, alpha: 1))))
                        .foregroundColor(.black)
                        
                    }
                    
                    Button(action: {
                        isSecured.toggle()
                    }) {
                        Image(systemName: self.isSecured ? "eye.slash" : "eye")
                            .accentColor(.gray)
                            .frame(width: 22, height: 22)
                    }

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
            }.padding([.bottom, .top] , 10)
           

       
    }
}


