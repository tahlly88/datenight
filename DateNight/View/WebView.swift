//
//  WebView.swift
//  DateNight
//
//  Created by Michael Gates on 7/1/22.
//


import SwiftUI
import WebKit
 
struct WebView: UIViewRepresentable {
 
	var url: URL
 
	func makeUIView(context: Context) -> WKWebView {
		return WKWebView()
	}
 
	func updateUIView(_ webView: WKWebView, context: Context) {
		let request = URLRequest(url: url)
		webView.load(request)
	}
}
