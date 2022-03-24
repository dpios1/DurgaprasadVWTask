//
//  ViewController.swift
//  DurgaprasadTask
//
//  Created by SPURGE on 23/03/22.
//

import UIKit

class PeopleViewController: UIViewController {
    @IBOutlet weak var tableViewPeople: UITableView!
    private var peopeVwModel  : PeopeViewModel!
    private var dataSource : TableViewDataSource<PeopleTableViewCell,People>!

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        callViewModelForUIUpdate()
        // Do any additional setup after loading the view.
    }
    fileprivate func registerCell(){
        tableViewPeople.register(UINib(nibName: "PeopleTableViewCell", bundle: nil), forCellReuseIdentifier: "PeopleTableViewCell")
    }
    fileprivate func callViewModelForUIUpdate(){
        peopeVwModel = PeopeViewModel()
        peopeVwModel.bindPeopleViewModelToController = {
            self.updateDataSource()
        }
    }
    fileprivate func updateDataSource(){
        self.dataSource = TableViewDataSource(cellIdentifier: "PeopleTableViewCell", items: peopeVwModel.peoples, configureCell: { (cell, people) in
            DispatchQueue.main.async {
                cell.initPeopeData(people)
            }
        })
        DispatchQueue.main.async {
            self.tableViewPeople.dataSource = self.dataSource
            self.tableViewPeople.delegate = self.dataSource
            self.tableViewPeople.reloadData()
        }
        self.peopleDetailView()
    }
    
    func peopleDetailView(){
        self.dataSource.completionHandlerDidSelect = { indexpath in
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let peopleDetail = storyboard.instantiateViewController(withIdentifier: "PeopleDetailViewController") as? PeopleDetailViewController
            peopleDetail?.people = self.peopeVwModel.peoples[indexpath.row]
            self.navigationController?.pushViewController(peopleDetail ?? UIViewController(), animated: true)
        }
    }

}

