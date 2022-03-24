//
//  RoomViewModel.swift
//  DurgaprasadTask
//
//  Created by SPURGE on 24/03/22.
//

import Foundation

class RoomViewModel : NSObject {
    private(set) var rooms : [Rooms]! {
        didSet {
            self.bindPeopleViewModelToController()
        }
    }
    
    var bindPeopleViewModelToController : (() -> ()) = {}
    override init() {
        super.init()
        self.roomsData()
    }
    func roomsData() {
        //use loginResource to call login API
        let roomResource = RoomResource()
        roomResource.roomData(ApiEndpoints.rooms) { result in
            DispatchQueue.main.async {
                self.rooms = result?.filter({$0.isOccupied}) ?? []
            }
        }
    }
}
