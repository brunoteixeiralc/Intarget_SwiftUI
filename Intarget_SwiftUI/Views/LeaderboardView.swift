//
//  LeaderboardView.swift
//  Intarget_SwiftUI
//
//  Created by Bruno Teixeira Lemgruber Correa on 03/12/21.
//

import SwiftUI

struct LeaderboardView: View {
    
    @Binding var leaderboardIsShowing: Bool
    @Binding var game: Game
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack (spacing: 10) {
                HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
                LabelView()
                ScrollView {
                    VStack(spacing:10){
                        ForEach(game.leaderboardEntries.indices){ i in
                            let leaderboardEntry = game.leaderboardEntries[i]
                            RowView(index: i, score: leaderboardEntry.score, date: leaderboardEntry.date)
                        }
                    }
                }
            }
        }
    }
}

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date
    
    var body: some View {
        HStack {
            RoundTextView(text: String(index))
            Spacer()
            ScoreText(score: score)
                .frame(maxWidth:Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            DateText(date: date)
                .frame(maxWidth:Constants.Leaderboard.leaderboardDateColWidth)
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(Color("LeaderboardColor"),lineWidth: Constants.General.strokeWidth)
        )
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth:Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}

struct HeaderView: View {
    @Binding var leaderboardIsShowing: Bool
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        ZStack {
            HStack {
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    BigBoldText(text: "leaderboard")
                        .padding(.leading)
                    Spacer()
                }else{
                    BigBoldText(text: "leaderboard")
                }
            }
            HStack {
                Spacer()
                Button(action: {
                    leaderboardIsShowing  = false
                }) {
                    RoundedImageViewFilled  (systemName: "xmark")
                        .padding(.trailing)
                }
            }
        }
        .padding(.top)
    }
}

struct LabelView: View {
    var body: some View {
        HStack {
           Spacer()
                .frame(width: Constants.General.roundedViewLength)
            Spacer()
            LabelText(text: "Score")
                .frame(width:Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            LabelText(text: "Date")
                .frame(width:Constants.Leaderboard.leaderboardDateColWidth)
        }
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth:Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    
    static private var leaderboardIsShowing = Binding.constant(false)
    static private var game = Binding.constant(Game(loadTestData: true))
    
    static var previews: some View {
        LeaderboardView(leaderboardIsShowing: leaderboardIsShowing,game: game)
        LeaderboardView(leaderboardIsShowing: leaderboardIsShowing,game: game)
            .previewLayout(.fixed(width: 568, height: 320))
        
        LeaderboardView(leaderboardIsShowing: leaderboardIsShowing,game: game).preferredColorScheme(.dark)
        LeaderboardView(leaderboardIsShowing: leaderboardIsShowing,game: game)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
