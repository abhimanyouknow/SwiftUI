//
//  MissionView.swift
//  Moonshot
//
//  Created by C3PO MBP on 27/11/24.
//

import SwiftUI

/* challenge 2 - part 1.2
 moving nested Struct CrewMember out of MissionView struct as
 this has to be accessed by CrewView as well */
struct CrewMember {
    let role: String // from missions.json
    let astronaut: Astronaut // from astronauts.json
}

struct MissionView: View {
    // merging data from two different json files
    let mission: Mission
    let crew: [CrewMember] /* defined the property, but we
                             need to set it - done using custom
                            initializer below */
    
    var body: some View {
        ScrollView {
            VStack {
                VStack(spacing: 20) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .containerRelativeFrame(.horizontal) { width, axis in
                            width * 0.6
                        }
                    
                    /* challenge 1
                     display launch date below mission badge */
                    Text("Launch Date: \(mission.formattedLaunchDate)")
                        .foregroundStyle(.white.opacity(0.7))
                }
                
                VStack(alignment: .leading) {
                    // challenge 2 - part 2.1
                    CustomDividerView()
                    
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(mission.description)
                    
                    // challenge 2 - part 2.1
                    CustomDividerView()
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                }
                .padding(.horizontal)
                
                // challenge 2 - part 1.1
                CrewView(crew: crew)
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    // initializer for setting the CrewMember property
    // merging codable structs
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            // look up the member name in the astronauts dictionary
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionView(mission: missions[1], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
