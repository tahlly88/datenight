//
//  FooterView.swift
//  DateNight
//
//  Created by Michael Gates on 6/29/22.
//

import SwiftUI



struct FooterView: View {
	//Properties
	@State var showWebView = false
    @State var acceptButton = false
	let contentView = ContentView()
    //var datenightIndex:
    var datenight: discoveredPlace
	let haptics = UINotificationFeedbackGenerator()
    var body: some View {
		HStack {

			//The "select place" button
			Button(action: {
				playUiSound(sound: "button_select", type: "wav")
				self.haptics.notificationOccurred(.success)
				self.showWebView.toggle()
			}) {
				Text("Go Out Here!".uppercased())
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
					.sheet(isPresented: $showWebView){
                        //WebView(url: URL(string: datenightData[0].url)!)
                        WebView(url: URL(string: datenight.url)!)
					}
			}
            

			}
		.padding()
    }

}


struct FooterView_Previews: PreviewProvider {
	
    static var previews: some View {
        FooterView(datenight: datenightData[0])
			.previewLayout(.fixed(width: 375, height: 80))
    }
}
