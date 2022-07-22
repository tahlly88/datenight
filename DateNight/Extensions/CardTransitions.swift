//
//  CardTransitions.swift
//  DateNight
//
//  Created by Michael Gates on 7/1/22.
//

import SwiftUI

extension AnyTransition {
	static var leftBottom: AnyTransition {
		AnyTransition.asymmetric(insertion: .identity,
								 removal: AnyTransition.move(edge: .trailing).combined(with: .move(edge: .bottom)))
	}
	
	static var rightBottom: AnyTransition {
		AnyTransition.asymmetric(insertion: .identity,
								 removal: AnyTransition.move(edge: .leading).combined(with: .move(edge: .bottom)))
	}
}
