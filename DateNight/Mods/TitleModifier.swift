//
//  TitleModifier.swift
//  DateNight
//
//  Created by Michael Gates on 6/30/22.
//

import SwiftUI

struct TitleModifier: ViewModifier {
	func body(content: Content) -> some View{
		content
			.font(.largeTitle)
			.foregroundColor(Color.blue)
	}
}

