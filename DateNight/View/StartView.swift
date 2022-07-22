//
//  StartView.swift
//  DateNight
//
//  Created by Michael Gates on 7/17/22.
//


import SwiftUI

struct StartView: View {
  
  @AppStorage("start") var isStartViewActive: Bool = true
  
  @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
  @State private var buttonOffset: CGFloat = 0
  @State private var isAnimating: Bool = false
  @State private var imageOffset: CGSize = .zero
  @State private var indicatorOpacity: Double = 1.0
  @State private var textTitle: String = "Welcome!"
  
  let hapticFeedback = UINotificationFeedbackGenerator()
  
  var body: some View {
    ZStack {
        Color(.black)
        .ignoresSafeArea(.all, edges: .all)
      
      VStack(spacing: 90) {
        Spacer()
          VStack( spacing: 50) {
          Text(textTitle)
            .font(.system(size: 60))
            .fontWeight(.heavy)
            .foregroundColor(.white)
            .transition(.opacity)
            .id(textTitle)
          Text("""
          This is my app for my Senior Project.
          
          In the next screen tap the Hat icon to see more information about me.
          
          Tap the Go Out Here! button to bring up a website about the location.
          
          Click the back arrow to return to this screen.
          
          All pictures were taken from the public domain.
          """)
            .font(.title3)
            .fontWeight(.light)
			.foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 10)
        }
        .opacity(isAnimating ? 1 : 0)
        .offset(y: isAnimating ? 0 : -40)
        .animation(.easeOut(duration: 1), value: isAnimating)

        ZStack {
        Spacer()
       
        .frame(width: buttonWidth, height: 80, alignment: .center)
        .padding()
        .opacity(isAnimating ? 1 : 0)
        .offset(y: isAnimating ? 0 : 40)
        .animation(.easeOut(duration: 1), value: isAnimating)
      }
    }
    .onAppear(perform: {
      isAnimating = true
    })
    .preferredColorScheme(.dark)
  }
}

struct StartView_Previews: PreviewProvider {
  static var previews: some View {
    StartView()
  }
}

}
