//
//  HeaderComponent.swift
//  DateNight
//
//  Created by Michael Gates on 6/30/22.
//  This is the file for header logo

import SwiftUI

struct HeaderComponent: View {
    var body: some View {
		VStack(alignment: .center, spacing: 20) {
            RoundedRectangle(cornerRadius: 3)
				.frame(width:120.5, height: 6.1)
				.foregroundColor(Color.secondary)
				.opacity(0.25)
			Image("logo-datenight")
				.resizable()
				.scaledToFit()
				.frame(height: 28.1)
                .shadow(color: .gray , radius: 3, x: 4, y: 1)
		}
    }
}

struct HeaderComponent_Previews: PreviewProvider {
    static var previews: some View {
        HeaderComponent()
			.previewLayout(.fixed(width: 375, height: 128))
    }
}
