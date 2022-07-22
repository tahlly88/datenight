//
//  LoginView.swift
//  DateNight
//
//  Created by Michael Gates on 7/21/22.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import FBSDKLoginKit
import Firebase
import FBSDKCoreKit

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
				   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
	FirebaseApp.configure()

	return true
  }
}

struct LoginView: View {
	@AppStorage("start") var isStartViewActive: Bool = true
	let haptics = UINotificationFeedbackGenerator()
	@UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
	
	
    var body: some View {
		VStack {
			Image("logo-datenight")
				.resizable(capInsets: EdgeInsets(top: 24.0, leading: 24.0, bottom: 24.0, trailing: 24.0), resizingMode: .stretch)
				.padding(.bottom, 300.0)
				.frame(width: 250.0, height: 75.0)
			HStack{
				Text("👥")
					
				Text("🫂")
					.onTapGesture {
						isStartViewActive = false
					}
					
			}
			Text("""
				Welcome!
				""")
				.font(.largeTitle)
				.fontWeight(.heavy)
				.multilineTextAlignment(.center)
				
			Button(action: {
				playUiSound(sound: "button_low", type: "wav")
				self.haptics.notificationOccurred(.success)
				isStartViewActive = false
			}) {
				Text("Sign up".uppercased())
					.font(.largeTitle)
					.fontWeight(.bold)
					.foregroundColor(Color.black)
					.padding(.horizontal, 19.0)
					.padding(.vertical, 11.0)
					.background(
						RoundedRectangle(cornerRadius: 25)
					).accentColor(Color.gray)
					
					
			}
			Button(action: {
				playUiSound(sound: "button_select", type: "wav")
				self.haptics.notificationOccurred(.success)
				isStartViewActive = false
			}) {
				Text("Email Login".uppercased())
					.font(.largeTitle)
					.fontWeight(.bold)
					.foregroundColor(Color.black)
					.padding(.horizontal, 19.0)
					.padding(.vertical, 11.0)
					.accentColor(Color.blue)
					.background(
						RoundedRectangle(cornerRadius: 5)
					)
					
					
			}
			Button(action: {
				playUiSound(sound: "button_select", type: "wav")
				self.haptics.notificationOccurred(.success)
				//isStartViewActive = false
				
			}) {
				Text("facebook login".uppercased())
					.font(.largeTitle)
					.fontWeight(.bold)
					.foregroundColor(Color.white)
					.padding(.horizontal, 19.0)
					.padding(.vertical, 11.0)
					.accentColor(Color.blue)
					.background(
						RoundedRectangle(cornerRadius: 0)
					).foregroundColor(Color.blue)
					
					
			}
			Button(action: {
				playUiSound(sound: "triangle", type: "wav")
				self.haptics.notificationOccurred(.error)
				isStartViewActive = false
			}) {
				Text("skip sign in".uppercased())
					.font(.largeTitle)
					.fontWeight(.bold)
					.foregroundColor(Color.black)
					.padding(.horizontal, 19.0)
					.padding(.vertical, 11.0)
					.accentColor(Color.blue)
					.background(
						RoundedRectangle(cornerRadius: 30)
					).foregroundColor(Color.white)
					
					
			}
			GoogleSignInButton()
				.padding()
						.onTapGesture {
							isStartViewActive = false
						}
			
			
		}.preferredColorScheme(.dark)
    }
	

		



}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
//h







