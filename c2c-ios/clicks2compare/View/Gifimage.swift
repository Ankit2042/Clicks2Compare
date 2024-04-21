//
//  Gifimage.swift
//  clicks2compare
//
//  Created by Nitin Singh on 17/01/24.


import SwiftUI
import WebKit

struct Gifimage: UIViewRepresentable {
    private let name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        let url = Bundle.main.url(forResource: name, withExtension: "gif")!
        let data = try! Data(contentsOf: url)
        
        webView.load(
            data,
            mimeType: "image/gif",
            characterEncodingName: "UTF-8",
            baseURL: url.deletingLastPathComponent())
        
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.reload()
    }
    
    typealias UIViewType = WKWebView
}

struct Gifimage_Previews: PreviewProvider {
    static var previews: some View {
        Gifimage("Welcome")
    }
}
