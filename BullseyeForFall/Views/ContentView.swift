//
//  ContentView.swift
//  BullseyeForFall
//
//  Created by Jeffery Mason on 7/12/21.
//

import SwiftUI

struct ContentView: View {

  @State private var alertIsVisible = false
  @State private var sliderValue = 50.0
  @State private var game = Game()

  var body: some View {
    ZStack {
        BackgroundView(game: $game)
        VStack {
            InstructionText(text: "🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                .padding(.leading, 30.0)
                .padding(.trailing, 30.0)
            BigNumberText(text: String(game.target))
          HStack {
            SliderLabelText(text: "1")
            Slider(value: $sliderValue, in: 1.0...100.0)
            SliderLabelText(text: "100")
          }
          .padding()
          Button(action: {
            alertIsVisible = true
          }) {
            Text("HIT ME")
                .bold()
                .font(.title3)
          }
          .padding(20.0)
          .background(
            ZStack {
                Color.blue
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
            }
          )
          .foregroundColor(Color.white)
          .cornerRadius(21.0)
          .alert(isPresented: $alertIsVisible, content: {
            let roundedValue = Int(sliderValue.rounded())
            let points = game.points(sliderValue: roundedValue)
            return Alert(title: Text("Hello there!"), message: Text("The slider's value is \(roundedValue).\n" + "You scored \(points) points this round."), dismissButton: .default(Text("Awesome!")) {
                game.startNewRound(points: points)
            })
          })
        }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
    ContentView()
      .previewLayout(.fixed(width: 568, height: 320))
    ContentView()
      .preferredColorScheme(.dark)
    ContentView()
      .preferredColorScheme(.dark)
      .previewLayout(.fixed(width: 568, height: 320))
  }
}

