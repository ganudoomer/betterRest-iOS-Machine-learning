//
//  ContentView.swift
//  betterRest
//
//  Created by Sree on 19/09/21.
//

import SwiftUI
// Working with dates is a little hard
// Work with apples framework
// Core ML and Create ML (adding ML) Tabular Regresstion
// Train the modal and predictions

struct ContentView: View {
    @State private var wakeUp = Date()
    @State private var sleepAmount = 8.0
    var body: some View {
//        var components = DateComponents()
//        components.hour = 8
//        components.minute = 0
        let components = Calendar.current.dateComponents([.hour,.minute], from: Date())
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
    // Date formatter
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let dateString = formatter.string(from: Date())
        
       return VStack{
        Form{
        // Stepper
        Stepper(value: $sleepAmount,in: 4...12,step:0.25){
            Text("\(sleepAmount,specifier:"%g") hours")
        }
        // Date Picker
            DatePicker("Pick a date \(hour)",selection:$wakeUp,in: Date()...)
            DatePicker("Pick a time \(dateString) \(minute)",selection:$wakeUp,displayedComponents:.hourAndMinute)
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
  
    static var previews: some View {
        ContentView()
    }
}
