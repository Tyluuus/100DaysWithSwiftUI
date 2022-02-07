//
//  GridLayout.swift
//  Moonshot
//
//  Created by Piotr Tyl on 21/11/2021.
//

import SwiftUI

struct GridLayout: View {
    let missions: [Mission]
    let astronauts: [Astronaut]
    let columns = [GridItem(.adaptive(minimum:150))]
    
    var body: some View {
        NavigationView{
        ScrollView {
            LazyVGrid(columns: self.columns) {
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

struct GridLayout_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        GridLayout(missions: missions, astronauts: astronauts)
    }
}
