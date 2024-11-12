//
//  ContentView.swift
//  BetterRest
//
//  Created by C3PO MBP on 12/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // formatting date time -
        
        /* option 1 (this automatically formats data as per
         user's locale settings or preferences */
        // eg 1 - if we just want hour and minute
        Text(Date.now, format: .dateTime.hour().minute())
        
        // eg 2 -if we want day, month and year
        Text(Date.now, format: .dateTime.day().month().year())
        
        // option 2 (passing in custom formatting)
        // eg 1
        Text(Date.now.formatted(date: .long, time: .shortened))
        
        // eg 2
        Text(Date.now.formatted(date: .abbreviated, time: .complete))
        
    }
    
    // best to use Swift framework for date calculations
    func exampleDates() {
        /* let's say we want to set wake up date to 8:00 am
         each day */
        var components = DateComponents()
        components.hour = 8
        components.minute = 0
        let date = Calendar.current.date(from: components) ?? .now
            /* the reason we're using nil coalescing here is
             becuase the .date(from:) returns an optional
             value */
        
        /* now let's say we want to get only the hour and
         minute input from the user */
        let components2 = Calendar.current.dateComponents([.hour, .minute], from: .now)
            /* here we are just getting the hour & minute
             data from the current date */
        let hour = components2.hour ?? 0
        let minute = components2.minute ?? 0
         /* the reason we're using nil coalescing is because
          the object we get in components2 is an optional
          one, even though we know that the user will
          specifiy a value, we have to give a default value
          from out end */
    }
}

#Preview {
    ContentView()
}
