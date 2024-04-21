//
//  SettingsRowView.swift
//  clicks2compare
//
//  Created by Nitin Singh on 27/12/23.
//

import SwiftUI

struct SettingsRowView: View {
    let imageName: String
    let title: String
    let tintColor: Color
    var body: some View {
        HStack{
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .foregroundColor(Color.theme.blueWhite)
            
            Text(title)
                .font(.subheadline)
                .foregroundColor(.primary)
        }
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.black))
    }
}
