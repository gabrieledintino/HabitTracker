//
//  ContentView.swift
//  HabitTracker
//
//  Created by Gabriele on 16/03/2020.
//  Copyright © 2020 Gabriele. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var trackedObjects = Tracked()
    @State private var showingAddItemView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(trackedObjects.items) { object in
                    HStack {
                        VStack {
                            Text(object.name)
                                .font(.headline)
                            Text(object.description)
                        }
                        Spacer()
                        Text("Completed \(object.count) times")
                    }
                }
            }
        .navigationBarTitle("Test")
        .navigationBarItems(trailing:
            HStack(spacing: 15) {
                EditButton()
                Button(action: {
                    self.showingAddItemView = true
                }) {
                    Image(systemName: "plus")
                }
            }
        )
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
