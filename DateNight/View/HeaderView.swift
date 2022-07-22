//
//  HeaderView.swift
//  DateNight
//
//  Created by Michael Gates on 6/29/22.
//

import SwiftUI

struct HeaderView: View {
	//Properties
	@Binding var showDevInfo: Bool
    @AppStorage("start") var isStartViewActive: Bool = true
	let haptics = UINotificationFeedbackGenerator()
    var body: some View {
		HStack{
            Button(action: {
                //About button
                //This button will use WebKit to display my website.
                playUiSound(sound: "click", type: "mp3")
                self.haptics.notificationOccurred(.success)
                isStartViewActive = true
            }) {
                
                Image(systemName: "clear")
                    .font(.system(size: 30))
                    .foregroundColor(Color.purple)
                    .shadow(color: .gray , radius: 2, x: 3, y: 2)
            }
			Spacer()
			Image("logo-datenight")
				.resizable()
				.scaledToFit()
				.frame( height: 39)
                .shadow(color: .gray , radius: 3, x: 4, y: 1)
			Spacer()
			
			//Right Side Button
			Button(action: {
				//About button
				//This button will use WebKit to display my website.
				playUiSound(sound: "button_low", type: "wav")
				self.haptics.notificationOccurred(.success)
				self.showDevInfo.toggle()
			}) {
				
				Image(systemName: "graduationcap.circle")
					.font(.system(size: 30))
					.foregroundColor(Color.purple)
                    .shadow(color: .gray , radius: 2, x: 3, y: 2)
			}
			.accentColor(Color.primary)
			.sheet(isPresented: $showDevInfo) {
					WebView(url: URL(string: "https://michael.gateswebs.ga")!)
			}
		}
		.padding()
    }
}

struct HeaderView_Previews: PreviewProvider {
	@State static var showGuide: Bool = false
	@State static var showInfo: Bool = false
    static var previews: some View {
		HeaderView(showDevInfo: $showInfo)
			.previewLayout(.fixed(width: 375, height: 80))
    }
}
