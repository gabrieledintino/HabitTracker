//
//  AddItemView.swift
//  HabitTracker
//
//  Created by Gabriele on 16/03/2020.
//  Copyright © 2020 Gabriele. All rights reserved.
//

import SwiftUI

struct AddItemView: View {
    @ObservedObject var trackedObjects: Tracked
    @State private var title = ""
    @State private var description = ""
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Nome dell'attività", text: $title)
                TextField("Descrizione dell'attività", text: $description)
            }
            .navigationBarTitle("Aggiungi un'attività")
            .navigationBarItems(trailing: Button("Salva") {
                let item = TrackedItem(name: self.title, description: self.description, count: 0)
                self.trackedObjects.items.append(item)
                self.presentationMode.wrappedValue.dismiss()
                })
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView(trackedObjects: Tracked())
    }
}
