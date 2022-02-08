//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Piotr Tyl on 08/02/2022.
//

import SwiftUI
import CoreData

struct FilteredList: View {
    
    @FetchRequest var fetchRequest: FetchedResults<Singer>
    
    
    
    var body: some View {
        List(fetchRequest, id: \.self) { singer in
            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
        }
    }
    
    init(filter: String) {
        _fetchRequest = fetchRequest<Singer>(sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINWITH %@", filter))
    }
}


