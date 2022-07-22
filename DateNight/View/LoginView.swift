//
//  LoginView.swift
//  DateNight
//
//  Created by Michael Gates on 7/21/22.
//

import SwiftUI




struct LoginView: View {
	@AppStorage("start") var isStartViewActive: Bool = true
	let haptics = UINotificationFeedbackGenerator()
	@State var hiddenMenu = false
	@State var showEmailSignUp = false
	@State var showEmailSignIn = false
	
    var body: some View {
		VStack {
			Image("logo-datenight")
				.resizable(capInsets: EdgeInsets(top: 24.0, leading: 24.0, bottom: 24.0, trailing: 24.0), resizingMode: .stretch)
				.padding(.bottom, 300.0)
				.frame(width: 250.0, height: 75.0)
			HStack{
				Text("👥")
					.onTapGesture{
						self.hiddenMenu.toggle()
					}
					.sheet(isPresented: $hiddenMenu){
						StartView()
					}
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
				//isStartViewActive = false
				self.showEmailSignUp.toggle()
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
					.sheet(isPresented: $showEmailSignUp){
						EmailSignUpView()
					}
					
			}
			Button(action: {
				playUiSound(sound: "button_select", type: "wav")
				self.haptics.notificationOccurred(.success)
				//isStartViewActive = false
				self.showEmailSignIn.toggle()
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
					.sheet(isPresented: $showEmailSignIn){
						EmailSignIn()
					}
					
					
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
			
			
			
		}.preferredColorScheme(.dark)
    }
	

		



}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
//h







