//
//  SymbolModifiers.swift
//  DateNight
//
//  Created by Michael Gates on 7/1/22.
//

import SwiftUI

struct SymbolModifiers2: ViewModifier {
	func body (content: Content) -> some View {
		content.foregroundColor(Color(red: 211, green: 211, blue: 211))
			.font(.system(size: 128))
			.shadow(color: Color(UIColor(red:0, green:0, blue:0, alpha:0.1)), radius: 12, x: 0, y: 0)
	}
}
