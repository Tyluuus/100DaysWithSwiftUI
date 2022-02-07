//
//  ListLayout.swift
//  Moonshot
//
//  Created by Piotr Tyl on 21/11/2021.
//

import SwiftUI

struct ListLayout: View {
    let missions: [Mission]
    let astronauts: [Astronaut]
    
    
    var body: some View {
        NavigationView{
        ScrollView {
            LazyVStack(spacing: 35) {
                ForEach(self.missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: self.astronauts)
                    } label: {
                        VStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)

                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)

                        }
                    }
                }
            }
        }
    }
}
}

struct ListLayout_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        ListLayout(missions: missions, astronauts: astronauts)
    }
}
