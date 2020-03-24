//
//  ContentView.swift
//  HabitTracker
//
//  Created by Gabriele on 16/03/2020.
//  Copyright © 2020 Gabriele. All rights reserved.
//

import SwiftUI

struct Tile: View {
    var item: TrackedItem
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 200, height: 75)
                LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .top, endPoint: .bottom)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            HStack {
                VStack(alignment: .leading) {
                    Text("\(item.name)")
                        .font(.headline)
                        .foregroundColor(.white)
                    Text("\(item.description)")
                        .foregroundColor(.white)
                }
                .frame(maxWidth: 200, maxHeight: 100)
                Spacer()
                Text("Completed \(item.count) times")
                    .foregroundColor(.white)
            }
        }
    }
}

struct ContentView: View {
    @ObservedObject var trackedObjects = Tracked()
    @State private var showingAddItemView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(trackedObjects.items.indices, id: \.self) { index in
                    NavigationLink(destination: DetailView(index: index).environmentObject(self.trackedObjects)) {
//                        HStack {
//                            VStack(alignment: .leading) {
//                                Text(self.trackedObjects.items[index].name)
//                                    .font(.headline)
//                                Text(self.trackedObjects.items[index].description)
//                            }
//                            .frame(maxWidth: 200, maxHeight: 100)
//                            Spacer()
//                            Text("Completed \(self.trackedObjects.items[index].count) times")
//                        }
                        Tile(item: self.trackedObjects.items[index])
                    }
                }
                .onDelete(perform: removeItems)
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
            })
        .sheet(isPresented: $showingAddItemView) {
            AddItemView(trackedObjects: self.trackedObjects)
        }
            
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        trackedObjects.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
