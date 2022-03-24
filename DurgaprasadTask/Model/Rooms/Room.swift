//
//  Room.swift
//  DurgaprasadTask
//
//  Created by SPURGE on 23/03/22.
//

import Foundation

struct Rooms: Decodable {
    let createdAt: String
    let isOccupied : Bool
    let maxOccupancy : Double
    let id : String
}
