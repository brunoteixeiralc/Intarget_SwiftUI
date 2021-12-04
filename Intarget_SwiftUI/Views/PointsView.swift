//
//  PointsView.swift
//  Intarget_SwiftUI
//
//  Created by Bruno Teixeira Lemgruber Correa on 29/11/21.
//

import SwiftUI

struct PointsView: View {
    @Binding var game:Game
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    
    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedValue)
        
        VStack(spacing: 10){
            InstructionText(text: "Your slider value is")
            BigNumberText(text: String(roundedValue))
            BodyText(text: "You scored \(points) points.\n 🎉🎉🎉")
            Button(action: {
                withAnimation {
                    alertIsVisible = false
                }
                game.startNewRound(points: points)
            })  {
                ButtonText(text: "Start a new round")
            }
        }
        .padding()
        .frame(maxWidth: 300)
        .background(Color("BackgroundColor"))
        .cornerRadius(Constants.General.roundRectCornerRadius)
        .shadow(radius: 10.0, x: 5, y: 5)
        .transition(.scale)
    }
}

struct PointsView_Previews: PreviewProvider {
    
    static private var alertVisible = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.0)
    static private var game = Binding.constant(Game())
    
    static var previews: some View {
        PointsView(game: game,alertIsVisible: alertVisible,sliderValue: sliderValue)
        PointsView(game: game,alertIsVisible: alertVisible,sliderValue: sliderValue)
            .previewLayout(.fixed(width: 568, height: 320))
        
        PointsView(game: game,alertIsVisible: alertVisible,sliderValue: sliderValue).preferredColorScheme(.dark)
        PointsView(game: game,alertIsVisible: alertVisible,sliderValue: sliderValue)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
