//
//  ContentView.swift
//  WeSplit
//
//  Created by Mike Pattee on 6/6/20.
//  Copyright © 2020 Mike Pattee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var numberOfPeopleString = "2"
    @State private var tipPercentageIndex = 2
    private var checkTotal: Double {
        Double(checkAmount) ?? 0
    }
    private var tipPercentage: Double {
        Double(tipPercentages[tipPercentageIndex]) / 100
    }
    private var tip: Double {
        checkTotal * tipPercentage
    }
    
    private var totalWithTip: Double {
        checkTotal + tip
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeopleString) ?? 2
        return totalWithTip / peopleCount
    }
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    TextField("Number of people", text: $numberOfPeopleString)
                        .keyboardType(.numberPad)
//                    Picker("Number of people", selection: $numberOfPeople) {
//                        ForEach(2 ..< 100) {
//                            Text("\($0) people")
//                        }
//                    }
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentageIndex) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Text("Check Amount: $\(checkTotal, specifier: "%.2f")")
                    Text("Tip @ \(tipPercentages[tipPercentageIndex])%: $\(tip, specifier: "%.2f")")
                    Text("Total with tip: $\(totalWithTip, specifier: "%.2f")")
                }
                
                Section(header: Text("Total Per Person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
        .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
