//
//  ContentView.swift
//  DateNight
//
//  Created by Michael Gates on 6/18/22.
//

import SwiftUI 
import UIKit

struct ContentView: View {
    
    @AppStorage("start") var isStartViewActive: Bool = true
  // Setting up the variables for telling the app when a button is pressed, a card is dragged
  // and animations that resemble tinder
  @State var showAlert: Bool = false
  @State var showHelp: Bool = false
  @State var showDevInfo: Bool = false
  @GestureState public var dragState = DragState.notDragging
  public var dragAreaThreshold: CGFloat = 50.0
  @State public var lastCardIndex: Int = 1
	@State public var cardRemovalTransition = AnyTransition.leftBottom
	@State public var datenightbool = false
	
    
    
  // Setting up the display of the cards
  @State var placeViews: [CardView] = {
	  
	  
    var views = [CardView]()
    for index in 0..<2 {
      views.append(CardView(datenight: datenightData[index]))
    }
    return views

  }()
    
	public func stopShowing() {
		
		
		
			print("Removing card")
		//datenightData[0].show = false
		//var datenightBool = datenightData[(lastCardIndex + 1) % datenightData.count]
		//datenightBool.show = false
		datenightData[(lastCardIndex - 1) % datenightData.count].show = false
			
		
		
	}
    
    
    
          //Logic to switch cards progmatically
  public func destroyCards() {
	 // let datenightBool = datenightData[(lastCardIndex) % datenightData.count]
	 // if datenightBool.show == true{
	  if datenightData[(lastCardIndex + 1) % datenightData.count].show{
		  print("card passed")
    placeViews.removeFirst()
    
    self.lastCardIndex += 1
    
    let datenight = datenightData[lastCardIndex % datenightData.count]
    
    let newCardView = CardView(datenight: datenight)
    
    placeViews.append(newCardView)
	  }
	  else {
		  lastCardIndex += 1
		  destroyCards()
		  print("card is false")
	  }
  }
  
  // Logic to tell Swift if the card was/is the first card
  
  public func isFirstCard(cardView: CardView) -> Bool {
    guard let index = placeViews.firstIndex(where: { $0.id == cardView.id }) else {
      return false
    }
    return index == 0
  }
  
  // Setting up a custom enumerator to design the drag gestures to match that of tinder
  
  enum DragState {
    case notDragging
    case holding
    case isBeingDragged(translation: CGSize)
    
    var translation: CGSize {
      switch self {
      case .notDragging, .holding:
        return .zero
      case .isBeingDragged(let translation):
        return translation
      }
    }
    
    var isDragging: Bool {
      switch self {
      case .isBeingDragged:
        return true
      case .holding, .notDragging:
        return false
      }
    }
    
    var isPressing: Bool {
      switch self {
      case .holding, .isBeingDragged:
        return true
      case .notDragging:
        return false
      }
    }
  }
  
    

    
  var body: some View {
      ZStack{
          if isStartViewActive {
              LoginView()
          }
          else{
    VStack {
      // Calling the header and the variables to tell if/when a button in the header is pressed
      HeaderView(showDevInfo: $showDevInfo)
        .opacity(dragState.isDragging ? 0.0 : 1.0)
		.animation(.default, value: 0)
		
		
      //Give it a bit of space between the header and the card to make it look better
      Spacer()
      
      // Time to start making the cards look nice
      ZStack {
        ForEach(placeViews) { cardView in cardView
            .zIndex(self.isFirstCard(cardView: cardView) ? 1 : 0)
            .overlay(
              ZStack {
                // Bottom left (X) symbol on the card
                Image(systemName: "heart.slash.circle")
				  //Code that displays the represented action while passing a threshhold on the screen
                  .modifier(SymbolModifiers2())
				  
				  //Setting the threshold
                  .opacity(self.dragState.translation.width < -self.dragAreaThreshold && self.isFirstCard(cardView: cardView) ? 1.0 : 0.0)
                
                // Bottom Right Symbol (Heart) on the card
                Image(systemName: "heart.circle")
				  //Code that displays the represented action while passing a threshhold on the screen
                  .modifier(SymbolModifiers())
				  //Setting the threshold
                  .opacity(self.dragState.translation.width > self.dragAreaThreshold && self.isFirstCard(cardView: cardView) ? 1.0 : 0.0)
              }
          )
			//Playing with different settings to try to mimic tinder
            .offset(x: self.isFirstCard(cardView: cardView) ?  self.dragState.translation.width : 0, y: self.isFirstCard(cardView: cardView) ?  self.dragState.translation.height : 0)
            .scaleEffect(self.dragState.isDragging && self.isFirstCard(cardView: cardView) ? 0.85 : 1.0)
            .rotationEffect(Angle(degrees: self.isFirstCard(cardView: cardView) ? Double(self.dragState.translation.width / 12) : 0)) 
			.animation(.interpolatingSpring(stiffness: 12, damping: 12), value: 0)
            .gesture(LongPressGesture(minimumDuration: 0.01)
              .sequenced(before: DragGesture())
              .updating(self.$dragState, body: { (value, state, transaction) in
                switch value {
                case .first(true):
                  state = .holding
                case .second(true, let drag):
                  state = .isBeingDragged(translation: drag?.translation ?? .zero)
                default:
                  break
                }
              })
              .onChanged({ (value) in
                guard case .second(true, let drag?) = value else {
                  return
                }
                
                if drag.translation.width < -self.dragAreaThreshold {
                  self.cardRemovalTransition = .rightBottom
					//print("Removing card")
					
                }
                
                if drag.translation.width > self.dragAreaThreshold {
                  self.cardRemovalTransition = .leftBottom
					//print("Saving Card")
					
					
                }
              })
              .onEnded({ (value) in
                guard case .second(true, let drag?) = value else {
                  return
                }
                
                if drag.translation.width < -self.dragAreaThreshold  {
					playUiSound(sound: "triangle", type: "wav")
					print("destroying")
					stopShowing()
					self.destroyCards()

                }
				  if drag.translation.width > self.dragAreaThreshold{
					  playUiSound(sound: "triangle", type: "wav")
					  self.destroyCards()
					  print("saving")
				  }
              })
          ).transition(self.cardRemovalTransition)
        }
      }
      .padding(.horizontal)
	 
		//Giving it some more space to match the top part of the screen
      Spacer()
      
      // Summoning the footer as well as its listener object
					//FooterView(datenight: datenightData[1])
                        FooterView(datenight: datenightData[(lastCardIndex - 1) % datenightData.count])
						.opacity(dragState.isDragging ? 0.0 : 1.0)
						.animation(.default, value: 0)
				}.preferredColorScheme(.dark)
	
  }
}
}
}
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
