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
    @Published var items = [TrackedItem]()
}
