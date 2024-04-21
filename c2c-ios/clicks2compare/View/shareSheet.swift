//
//  shareSheet.swift
//  clicks2compare
//
//  Created by user257152 on 2/8/24.
//

import SwiftUI
import UIKit

struct shareSheet: View {
    @State var shareText: ShareText?
    @State var share: String = "hii i am using C2C Referral Partner App You Install and Earning Money :  https://apps.apple.com/in/app/c2c-referral-partner/id6447002903"
        var body: some View {
            VStack {
                Button("Show Activity View") {
                    // 4. New Identifiable Share Text
//                    shareText = ShareText(text: "Hola 😀")
                   shareText = ShareText(text: share)
                    
                }
                .padding()
            }
            // 5. Sheet to display Share Text
            .sheet(item: $shareText) { shareText in
                ActivityView(text: shareText.text)
            }
        }
}

//#Preview {
//    shareSheet()
//}


struct ActivityView: UIViewControllerRepresentable {
    let text: String

    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityView>) -> UIActivityViewController {
        return UIActivityViewController(activityItems: [text], applicationActivities: nil)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityView>) {}
}

// 2. Share Text
struct ShareText: Identifiable {
    let id = UUID()
    let text: String
}
