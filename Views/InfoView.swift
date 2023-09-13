//
//  InfoView.swift
//  TempConverterApp
//
//  Created by Ariel Kwak on 9/12/23.
//

import SwiftUI
struct InfoView: View {
    var body: some View {
        VStack {
            Text("This is the ever-famous TempConverter turned into a working iOS app.")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
            
            Text("This is a moment of great celebration! People of the Earth, rejoice!")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding()
        }
        .navigationBarTitle("Info", displayMode: .inline)
    }
}
