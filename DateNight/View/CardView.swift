//
//  CardView.swift
//  DateNight
//
//  Created by Michael Gates on 6/28/22.
//  The purpose of this file is to shape the image and format the text.

import SwiftUI

struct CardView: View, Identifiable {
	//Properties
	
	let id = UUID()
	var datenight: discoveredPlace
	
    var body: some View {
		Image(datenight.image)
            //Add some modifiers to make the image look like a card
			.resizable()
			.cornerRadius(24)
			.frame(minWidth: 0, maxWidth: .infinity)
			.overlay(
				VStack(alignment: .center, spacing: 12 ){
					Text(datenight.place.uppercased())
                        .font(.title)
                        .foregroundColor(Color.white)
						.fontWeight(.bold)
                        .padding(.horizontal, 11.9)
                        .padding(.vertical, 3.9)
                        .shadow(radius: 1)
						.overlay(
                            //Here I am making a divider overlay out of a rectangle.
						Rectangle()
							.fill(Color.white)
							.frame(height:1),
						alignment: .bottom
                        )
                    Text(datenight.type.uppercased())
						.foregroundColor(Color.white)
				
				}
                    .frame(minWidth: 280.0)
                    .padding(.bottom,50.0),
				alignment: .bottom
			)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
		CardView(datenight: datenightData[0]).previewLayout(.fixed(width:375, height: 600))
    }
}
