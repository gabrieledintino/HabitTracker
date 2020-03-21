//
//  DetailView.swift
//  HabitTracker
//
//  Created by Gabriele on 19/03/2020.
//  Copyright © 2020 Gabriele. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @State var itemDetail: TrackedItem
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Text(itemDetail.name)
                    .font(.title)
                    .fontWeight(.bold)
                Text(itemDetail.description)
                Text("Numero di ripetizioni: \(itemDetail.count)")
                Spacer(minLength: 40)                
                Button("Incrementa ripetizioni") {
                    self.itemDetail.count += 1
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(itemDetail: TrackedItem(name: "Titolo", description: "Descrizione", count: 5))
    }
}
