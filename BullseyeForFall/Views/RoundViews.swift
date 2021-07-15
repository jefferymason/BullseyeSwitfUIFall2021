//
//  RoundViews.swift
//  BullseyeForFall
//
//  Created by Jeffery Mason on 7/14/21.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .frame(width: 56, height: 56)
    }
}

struct RoundedRectTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .kerning(-0.2)
            .bold()
            .font(.title3)
            .frame(width: 68.0, height: 56.0)
            .overlay(RoundedRectangle(cornerRadius: 21.0)
                        .stroke(lineWidth: 2.0)
                        .fill(Color(.lightGray)))
            
    }
}

struct RoundViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            RoundedRectTextView(text: "100")
        }
    }
}
