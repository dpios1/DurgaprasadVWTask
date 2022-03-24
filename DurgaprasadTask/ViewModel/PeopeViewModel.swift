//
//  PeopeViewModel.swift
//  DurgaprasadTask
//
//  Created by SPURGE on 23/03/22.
//

import Foundation

class PeopeViewModel : NSObject {
    private(set) var peoples : [People]! {
        didSet {
            self.bindPeopleViewModelToController()
        }
    }
    
    var bindPeopleViewModelToController : (() -> ()) = {}
    override init() {
        super.init()
        self.peopleData()
    }
    func peopleData() {
        //use loginResource to call login API
        let peopleResource = PeopleResource()
        peopleResource.peopleData(ApiEndpoints.people) { result in
            DispatchQueue.main.async {
                self.peoples = result ?? []
            }
        }
    }
}
