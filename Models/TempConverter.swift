//
//  TempConverter.swift
//  TempConverterApp
//
//  Created by Ariel Kwak on 9/12/23.
//

import SwiftUI
class TempConverter {
    enum TempUnit: String {
    case fahrenheit = "ºF"
    case celsius = "ºC"
   }
    
  // MARK: Fields
  var isConvertingCtoF: Bool = true
  var inputTemp: Int = 0
  var convertedTemp: Int?
    
  // Checks if the input temperature is below absolute zero
  func isBelowAbsoluteZero() -> Bool {
    if isConvertingCtoF {
      return Double(inputTemp) < -459.67
    } else {
      return Double(inputTemp) < -273.15
    }
  }
    
  // Set the input units (using switch-case instead of if-else, although both work)
  func setInputUnit(_ tempUnit: TempUnit) {
    switch tempUnit {
        case .fahrenheit:
            isConvertingCtoF = false
        case .celsius:
            isConvertingCtoF = true
    }
  }
    
  // Setter and getter methods
  func setInputTemp(_ temp: Int) {
    inputTemp = temp
  }

  func getConvertedTemp() -> Int? {
    return convertedTemp
  }
    
  func convertCtoF() {
    convertedTemp = Int(Double(inputTemp) * 9/5 + 32)
  }
  
  func convertFtoC() {
    convertedTemp = Int(Double(inputTemp - 32) * 5/9)
  }
    
  func convert() {
    guard Double(inputTemp) >= -459.67 else {
      convertedTemp = nil
      return
    }
    
    if isConvertingCtoF {
      convertCtoF() // Convert to °F
    } else {
      convertFtoC() // Convert to °C
    }
  }
}
