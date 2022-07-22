//
//  ButtonModifiers.swift
//  DateNight
//
//  Created by Michael Gates on 6/30/22.
//

import SwiftUI

struct ButtonModifiers: ViewModifier {
	func body(content: Content) -> some View {
		content
            .foregroundColor(Color.black)
            .font(.headline)
			.padding()
			.frame(minWidth: 0, maxWidth: .infinity)
			.background(RoundedRectangle(cornerRadius: 30).fill(Color.blue))
			
	}
}
