//
//  RoomsViewController.swift
//  DurgaprasadTask
//
//  Created by SPURGE on 24/03/22.
//

import UIKit

class RoomsViewController: UIViewController {

    @IBOutlet weak var tableViewPeople: UITableView!
    private var roomVwModel  : RoomViewModel!
    private var dataSource : TableViewDataSource<RoomsTableViewCell,Rooms>!

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        callViewModelForUIUpdate()
        // Do any additional setup after loading the view.
    }
    fileprivate func registerCell(){
        tableViewPeople.register(UINib(nibName: "RoomsTableViewCell", bundle: nil), forCellReuseIdentifier: "RoomsTableViewCell")
    }
    fileprivate func callViewModelForUIUpdate(){
        roomVwModel = RoomViewModel()
        roomVwModel.bindPeopleViewModelToController = {
            self.updateDataSource()
        }
    }
    fileprivate func updateDataSource(){
        self.dataSource = TableViewDataSource(cellIdentifier: "RoomsTableViewCell", items: roomVwModel.rooms, configureCell: { (cell, room) in
            DispatchQueue.main.async {
                cell.initRoomData(room)
            }
        })
        DispatchQueue.main.async {
            self.tableViewPeople.dataSource = self.dataSource
            self.tableViewPeople.delegate = self.dataSource
            self.tableViewPeople.reloadData()
        }
    }    
}
