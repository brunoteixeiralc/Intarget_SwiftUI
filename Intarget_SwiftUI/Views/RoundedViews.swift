//
//  RoundedViews.swift
//  Intarget_SwiftUI
//
//  Created by Bruno Teixeira Lemgruber Correa on 28/11/21.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: 56.0, height: 56.0)
            .overlay{
                Circle()
                    .strokeBorder(Color("ButtonStokeColor"), lineWidth: 2.0)
            }
    }
}

struct RoundedImageViewFilled: View {
    
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: 56.0, height: 56.0)
            .background{
                Circle()
                    .fill(Color("ButtonFilledBackgroundColor"))
            }
    }
}

struct RoundRectTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .kerning(-0.2)
            .bold()
            .font(.title3)
            .frame(width: 68.0, height: 56.0)
            .overlay{
                RoundedRectangle(cornerRadius: 21.0)
                    .strokeBorder(Color("ButtonStokeColor"), lineWidth: 2.0)
            }
    }
}

struct PreviewView: View {
    var body: some View {
        VStack(spacing: 10.0){
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            RoundedImageViewFilled(systemName: "list.dash")
            RoundRectTextView(text: "0")
        }
    }
}

struct RoundedViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
        PreviewView()
            .preferredColorScheme(.dark)
    }
}
