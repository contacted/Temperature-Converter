//
//  ContentView.swift
//  TempConversion
//
//  Created by Eugene on 14.12.21.
//

import SwiftUI

struct ContentView: View {
    @State private var tempValue = 0.0
    @State private var currentScale = ""
    @FocusState private var amountIsFocused: Bool
    
    let tempScales = ["Fahrenheit", "Kelvin"]
    
    var calculation: Double {
        if currentScale == "Fahrenheit" {
            return tempValue * 9 / 5 + 32
        } else if currentScale == "Kelvin" {
            return tempValue + 273.15
        } else {
            return 0.0
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("The value of temperature", value: $tempValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                } header: {
                    Text("Please enter temperature in Celsius:")
                }
                
                Section {
                    Picker("System Mode", selection: $currentScale) {
                        ForEach(tempScales, id: \.self) {
                            Text("\($0)")
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("Temperature Scale to convert to")
                }
                
                Section {
                    Text ("\(calculation.formatted())")
                } header: {
                    Text("Temperature as per chosen Scale")
                }
            }
            .navigationTitle("Temperature Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
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
