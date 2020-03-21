//
//  StructAndClasses.swift
//  HabitTracker
//
//  Created by Gabriele on 16/03/2020.
//  Copyright © 2020 Gabriele. All rights reserved.
//

import Foundation


struct TrackedItem: Identifiable, Codable {
    let id = UUID()
    var name: String
    var description: String
    var count: Int
}


class Tracked: ObservableObject {
    @Published var items = [TrackedItem]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([TrackedItem].self, from: items) {
                self.items = decoded
                return
            }
        }
        self.items = []
    }
}


