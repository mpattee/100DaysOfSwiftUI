//
//  ContentView.swift
//  VolumeConversion
//
//  Created by Mike Pattee on 6/9/20.
//  Copyright © 2020 Mike Pattee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var fromVolumeTypeIndex = 0
    @State private var toVolumeTypeIndex = 0
    @State private var valueString = ""

    private var value: Double {
        Double(valueString) ?? 0.0
    }
    
    private var valueInMililiters: Double {
        let conversionValue = volumeConversions[fromVolumeTypeIndex]
        return value * conversionValue
    }
    
    private var convertedValue: Double {
        let conversionValue = volumeConversions[toVolumeTypeIndex]
        return valueInMililiters / conversionValue
    }
    
    private var volumeTypes = ["mililiters", "liters", "cups", "pints", "gallons"]
    private var volumeConversions = [1.0, 1000.0, 236.588, 473.176, 3785.40800010238]
    
    
    var body: some View {
        Form {
            Section(header: Text("Starting Value")) {
                Picker(selection: $fromVolumeTypeIndex, label: Text("from unit")) {
                    ForEach(0 ..< volumeTypes.count) {
                        Text(self.volumeTypes[$0])
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                TextField("Starting Amount", text: $valueString).keyboardType(.decimalPad)
            }
            
            Section(header: Text("Resulting Value")) {
                Picker(selection: $toVolumeTypeIndex, label: Text("to unit")) {
                    ForEach(0 ..< volumeTypes.count) {
                        Text(self.volumeTypes[$0])
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                Text("Resulting Value: \(convertedValue, specifier: "%.2f")")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
