//
//  ViewController.swift
//  TempConverterApp
//
//  Created by Ariel Kwak on 9/12/23.
//

import SwiftUI
class ViewController: ObservableObject {
  @Published var tempConverter = TempConverter()
  @Published var inputTempString: String = ""
  @Published var convertedTempString: String = "0.0"
  @Published var isConvertingCtoF: Bool = true
  
  func setInputTempString(_ input: String) {
      inputTempString = input
  }
  
  func setConvertedTempString() {
    if let convertedTemp = tempConverter.convertedTemp {
          convertedTempString = String(convertedTemp)
      } else {
          convertedTempString = "N/A"
      }
  }
  
  func setInputTempUnit() {
    isConvertingCtoF ? tempConverter.setInputUnit(.celsius) : tempConverter.setInputUnit(.fahrenheit)
  }
  
  func convert() {
      let inputTemp = Int(inputTempString) ?? -500

      setInputTempUnit()
      
      tempConverter.inputTemp = inputTemp
      
      tempConverter.convert()
      
      setConvertedTempString()
  }
}
