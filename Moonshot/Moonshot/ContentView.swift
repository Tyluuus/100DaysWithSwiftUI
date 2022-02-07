//
//  ContentView.swift
//  Moonshot
//
//  Created by Piotr Tyl on 14/11/2021.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @State private var showingGrid = true
    
    let columns = [GridItem(.adaptive(minimum:150))]
    
    var body: some View {
        
        NavigationView {
            Group {
                if showingGrid {
                    GridLayout(missions: missions, astronauts: astronauts)
                } else {
                    ListLayout(missions: missions, astronauts: astronauts)
                    
                }
            }
//            ScrollView {
//                LazyVGrid(columns: columns) {
//                    ForEach(missions) { mission in
//                        NavigationLink {
//                            MissionView(mission: mission, astronauts: self.astronauts)
//                        } label: {
//                            VStack {
//                                Image(mission.image)
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 100, height: 100)
//
//                                VStack {
//                                    Text(mission.displayName)
//                                        .font(.headline)
//                                    Text(mission.formattedLaunchDate)
//                                        .font(.caption)
//                                }
//                                .padding(.vertical)
//                                .frame(maxWidth: .infinity)
//
//                            }
//                        }
//                    }
//                }
//            }
            .navigationTitle("Moonshot")
            .navigationBarItems(leading: Button(action: {
                showingGrid.toggle()
            }) {
                Text("Switch view")
            })
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
