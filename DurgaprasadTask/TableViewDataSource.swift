//
//  QuotesTableViewDataSource.swift
//  Quotes
//
//  Created by ItsDp on 04/07/21.
//

import Foundation
import UIKit


class TableViewDataSource<CELL : UITableViewCell,T> : NSObject, UITableViewDataSource,UITableViewDelegate {
    
    private var cellIdentifier : String!
    private var items : [T] = []
    var configureCell : (CELL, T) -> () = {_,_ in }
    var completionHandlerDidSelect: ((IndexPath)-> Void)? = nil
    init(cellIdentifier : String, items : [T], configureCell : @escaping (CELL, T) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items =  items
        self.configureCell = configureCell
    }
    func didSelectOnCells (tableDidSelect:@escaping(IndexPath) -> ()) {
        completionHandlerDidSelect=tableDidSelect
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CELL
        cell.selectionStyle = .none
        let item = self.items[indexPath.row]
        self.configureCell(cell, item)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let hit = completionHandlerDidSelect{
            hit(indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

