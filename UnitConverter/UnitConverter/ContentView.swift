//
//  ContentView.swift
//  UnitConverter
//
//  Created by Piotr Tyl on 15/07/2021.
//

import SwiftUI

func Cels2Fahrs(Cels: Double) -> Double {
    let output: Double = (Cels * 1.8) + 32
    return output
}

func Fahrs2Cels(Fahrs: Double) -> Double {
    let output: Double = (Fahrs - 32) * 0.5556
    return output
}

func Cels2Kalv(Cels: Double) -> Double {
    let output: Double = Cels + 273
    return output
}

func Kalv2Cels(Kalv: Double) -> Double {
    let output: Double = Kalv - 273
    return output
}

struct ContentView: View {
    @State private var temperatureInputUnit = 0
    @State private var temperatureOutputUnit = 0
    @State private var inputValue = ""
//    @State private var lengthUnit = 0
//    @State private var timeUnit = 0
//    @State private var volumeUnit = 0
    
    let temperatureUnits = ["Celsius", "Fahrenheit", "Kelvin"]
//    let lengthUnits = ["meters", "kilometers", "feet", "yard", "miles"]
//    let timeUnits = ["seconds", "minutes", "hours", "days"]
//    let volumeUnits = ["milliliters", "liters", "cups", "pints", "gallons"]
        
    var outputValue: Double {
        let input = Double(inputValue) ?? 0
        var output: Double = 0.0
        
        switch temperatureInputUnit{
        case 0:
            if temperatureOutputUnit == 0 {output = input}
            else if temperatureOutputUnit == 1 {output = Cels2Fahrs(Cels: input)}
            else {output = Cels2Kalv(Cels: input)}
        case 1:
            if temperatureOutputUnit == 0 {output = Fahrs2Cels(Fahrs: input)}
            else if temperatureOutputUnit == 1 {output = input}
            else {
                output = Cels2Kalv(Cels: Fahrs2Cels(Fahrs: input))
            }
        case 2:
            if temperatureOutputUnit == 0 {output = Kalv2Cels(Kalv: input)}
            else if temperatureOutputUnit == 1 {output = Cels2Fahrs(Cels: Kalv2Cels(Kalv: input))}
            else {output = input}
        default:
            print("Error")
        }
        
        return output
    }
    
    var body: some View {
        NavigationView {
        Form{
            Section(header: Text("Choose input unit")){
                Picker("Input unit", selection: $temperatureInputUnit){
                    ForEach(0 ..< temperatureUnits.count) {
                        Text("\(self.temperatureUnits[$0])")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("Choose output unit")) {
                Picker("Output unit", selection: $temperatureOutputUnit) {
                    ForEach(0 ..< temperatureUnits.count) {
                        Text("\(self.temperatureUnits[$0])")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("Input value")) {
                TextField("0.00", text: $inputValue)
                    .keyboardType(.decimalPad)
            }
            Section(header: Text("Result of conversion")) {
                Text("\(outputValue, specifier: "%.2f")")
            }
        }
        
        .navigationTitle("Units Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
