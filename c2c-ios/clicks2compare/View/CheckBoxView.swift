//
//  CheckBoxView.swift
//  clicks2compare
//
//  Created by user257152 on 2/5/24.
//

import SwiftUI

struct CheckBoxView: View {
     var checked: String = ""

    var body: some View {
        
        
        if checked == "Yes"{
            Image(systemName: "checkmark.square.fill")
                .foregroundColor(Color(UIColor.systemBlue) )
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        }else {
            Image(systemName: "square")
                .foregroundColor(Color.secondary)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        }

    }
}

struct CheckBoxView_Previews: PreviewProvider {
    struct CheckBoxViewHolder: View {
        @State var checked = false

        var body: some View {
            CheckBoxView(checked: "no")
        }
    }

    static var previews: some View {
        CheckBoxViewHolder()
    }
}

//#Preview {
//    CheckBoxView(checked: true)
//}
