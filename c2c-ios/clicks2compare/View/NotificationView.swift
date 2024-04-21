//
//  Notification.swift
//  clicks2compare
//
//  Created by user257152 on 2/4/24.
//

import SwiftUI

struct NotificationView: View {
    @StateObject private var viewModel = NotificationViewModel()
    
    var body: some View {
        NavigationView {
            
            
            ZStack {
                List(viewModel.notification?.data ?? [], id: \.self) { notiication in
                    
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        
                        Text("\(notiication.message)")
                            .font(.headline)
                        
                        
                        Text("\(notiication.date)")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        
                    }
                    .padding()
                    
                    if viewModel.isProgressView {
                        HUDProgressView(placeHolder: "Please Wait", show: $viewModel.isProgressView)
                               }
                }
                
                
            }
            .navigationBarTitle("Notifications")
            
        }
        .onAppear {
            viewModel.GetNotification()
        }
    }
}




//#Preview {
////    NotificationView()
//    NotificationView()
//}

