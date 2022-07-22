//
//  EmailSignUpView.swift
//  DateNight
//
//  Created by Michael Gates on 7/21/22.
//

import SwiftUI

struct EmailSignUpView: View {
	@State private var username: String = ""
	@State private var password: String = ""
	@AppStorage("start") var isStartViewActive: Bool = true
	
    var body: some View {
		VStack{
			Image("logo-datenight")
		Text("Sign Up")
		Form {
			Text("Enter your Email")
			TextField(text: $username, prompt: Text("user@user.com")) {
				Text("Username")
			}
			Text("Enter your password")
			SecureField(text: $password, prompt: Text("password")) {
				Text("Password")
			}
			Text("Repeat your password")
			SecureField(text: $password, prompt: Text("confirm password")) {
				Text("Password")
			}
		}
			Button(action: {
				playUiSound(sound: "button_select", type: "wav")
				//self.haptics.notificationOccurred(.success)
				//self.showWebView.toggle()
				isStartViewActive = false
			}) {
				Text("submit".uppercased())
				//Build the Caspule around the Select button
					.font(.largeTitle)
					.fontWeight(.bold)
					.padding(.horizontal, 19.0)
					.padding(.vertical, 11.0)
					.accentColor(Color.blue)
					.background(
						RoundedRectangle(cornerRadius: 30).stroke(Color.blue, lineWidth: 2)
					)
					.shadow(color: .gray , radius: 3, x: 4, y: 1)
			}
			
		
    }.preferredColorScheme(.dark)
	}
}

struct EmailSignUpView_Previews: PreviewProvider {
	@Binding var userData: String
    static var previews: some View {
		EmailSignUpView()
    }
}
