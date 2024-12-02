//
//  ContentView.swift
//  Moonshot
//
//  Created by C3PO MBP on 25/11/24.
//

import SwiftUI

struct ContentView: View {
    // challenge 3 - part 1
    @State private var toggleListView = false
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
        /* calling the extension method created in
         Bundle-Decodable.swift
         
         we've used type annotation here because the decode
         method now uses generics, and swift needs to know
         exactly what kind of (codable) data we're expecting in
         return from the decode method
         */
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            // challenge 3 - part 2
            Group {
                if toggleListView {
                    List {
                        ForEach(missions) { mission in
                            // project 9 - challenge 3 - part 3
                            NavigationLink(value: mission) {
                                //MissionView(mission: mission, astronauts: astronauts)
                                
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(mission.displayName)
                                            .font(.headline)
                                            .foregroundStyle(.white)
                                        
                                        Text(mission.formattedLaunchDate)
                                            .font(.caption)
                                            .foregroundStyle(.gray)
                                    }
                                    
                                    Spacer()
                                    
                                    Image(mission.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 75, height: 75)
                                }
                            }
                        }
                        .listRowBackground(Color.darkBackground)
                    }
                    .listStyle(.plain)
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(missions) { mission in
                                // project 9 - challenge 3 - part 4
                                NavigationLink(value: mission) {
                                    //MissionView(mission: mission, astronauts: astronauts)
                                    
                                    VStack {
                                        Image(mission.image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 100)
                                            .padding()
                                        
                                        VStack {
                                            Text(mission.displayName)
                                                .font(.headline)
                                                .foregroundStyle(.white)
                                            
                                            Text(mission.formattedLaunchDate)
                                                .font(.caption)
                                                .foregroundStyle(.gray)
                                        }
                                        .padding(.vertical)
                                        .frame(maxWidth: .infinity)
                                        .background(.lightBackground)
                                    }
                                    .clipShape(.rect(cornerRadius: 10))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.lightBackground)
                                    )
                                }
                            }
                        }
                        .padding([.horizontal, .bottom])
                    }
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            // challenge 3 - part 3
            .toolbar {
                Button("Toggle View", systemImage: "switch.2") {
                    withAnimation {
                        toggleListView.toggle()
                    }
                }
                .foregroundColor(.lightBackground)
            }
            // changing color of toggle button
            .tint(.white.opacity(0.5))
            // project 9 - challenge 3 - part 5
            .navigationDestination(for: Mission.self) { mission in
                MissionView(mission: mission, astronauts: astronauts)
            }
        }
    }
}

#Preview {
    ContentView()
}
