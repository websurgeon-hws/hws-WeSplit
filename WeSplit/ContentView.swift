//
//  Copyright © 2019 Peter Barclay. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeopleText = "2"
    @State private var tipPercentage = 2

    private var numberOfPeople: Int {
        return Int(numberOfPeopleText) ?? 2
    }

    let tipPercentages = [10, 15, 20, 25, 0]
    
    var tipPercentageAmount: Double {
        return Double(tipPercentages[tipPercentage])
    }
    
    var totalAmount: Double {
        let tipSelection = tipPercentageAmount
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection

        return orderAmount + tipValue
    }

    var totalPerPerson: Double {
        return totalAmount / Double(numberOfPeople)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        Text("Amount")
                            .foregroundColor(.secondary)
                        Spacer()
                        TextField("$123.45", text: $checkAmount)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.trailing)
                    }

                    HStack {
                        Text("Number of people")
                            .foregroundColor(.secondary)
                        Spacer()
                        TextField("e.g. 2", text: $numberOfPeopleText)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                    }
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Total")) {
                    Text("$\(totalAmount, specifier: "%.2f")")
                        .totalTipModifier(tipAmount: tipPercentageAmount)
                }
                
                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

extension View {
    func totalTipModifier(tipAmount: Double) -> some View {
        return self.modifier(TotalTipModifier(tipAmount: tipAmount))
    }
}

struct TotalTipModifier: ViewModifier {
    let tipAmount: Double
    
    func body(content: Content) -> some View {
        return content.foregroundColor(self.tipAmount == 0 ? .red : .black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
