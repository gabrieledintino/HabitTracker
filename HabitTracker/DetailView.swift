//
//  DetailView.swift
//  HabitTracker
//
//  Created by Gabriele on 19/03/2020.
//  Copyright © 2020 Gabriele. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var trackedObjects: Tracked
    var index: Int
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Text(self.trackedObjects.items[self.index].name)
                    .font(.title)
                    .fontWeight(.bold)
                Text(self.trackedObjects.items[self.index].description)
                Text("Numero di ripetizioni: \(self.trackedObjects.items[index].count)")
                Spacer(minLength: 40)
                Button("Incrementa ripetizioni") {
                    self.trackedObjects.items[self.index].count += 1
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(index: 0)
    }
}
