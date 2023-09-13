//
//  ContentView.swift
//  TempConverterApp
//
//  Created by Ariel Kwak on 9/12/23.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var viewController = ViewController()
  @State var inputTemp: String = ""
  var body: some View {
    NavigationView{
      ZStack {
        Color.blue.edgesIgnoringSafeArea(.all).opacity(0.80)
        LinearGradient(
          gradient: Gradient(colors: [Color.white, Color.gray]),
          startPoint: .topLeading,
          endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
        .opacity(0.45)
        
        VStack {
          Spacer()
          
          HStack {
            if viewController.isConvertingCtoF {
              Text("\(viewController.convertedTempString) ºF")
                  .font(.largeTitle)
                  .fontWeight(.ultraLight)
            } else {
                Text("\(viewController.convertedTempString) ºC")
                    .font(.largeTitle)
                    .fontWeight(.ultraLight)
            }

          }
          
          Spacer()
          
          Text("Enter Temperature:")
          
          HStack {
              TextField("Temp", text: $inputTemp).border(Color.white)
                .frame(width: 90.0)
                .multilineTextAlignment(.center)
          }
          
          Spacer()
          
          HStack(alignment: .center) {
            Text("ºF -> ºC")
              .fontWeight(.thin)
            Toggle(isOn: $viewController.isConvertingCtoF) {
              Text("")
            }
            .labelsHidden()
            .frame(width: 50)
            .padding()
            Text("ºC -> ºF")
             .fontWeight(.thin)
          }
          .padding()
          
          Button(action: {
            viewController.setInputTempString(inputTemp)
            viewController.convert()
          }) {
            Text("Convert")
          }
          .padding(.all)
          .background(Color.white)
          .cornerRadius(15)
          
          Spacer()
          
          NavigationLink(destination: InfoView()) {
            Image(systemName: "info.circle")
              .foregroundColor(.white)
          }
          .padding(.bottom, 50)
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
