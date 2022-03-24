//
//  PeopleDetailViewController.swift
//  DurgaprasadTask
//
//  Created by SPURGE on 23/03/22.
//

import UIKit

class PeopleDetailViewController: UIViewController {

    @IBOutlet weak var favColor: UILabel!
    @IBOutlet weak var jobTitle: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var userImg: UIImageView!
    
    var people  : People?
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    fileprivate func updateUI(){
        let username =  "Name: \((people?.firstName ?? "") + " " + (people?.lastName ?? ""))"
        name.text = username
        email.text = "Email: \(people?.email ?? "")"
        jobTitle.text = "JobTitle: \(people?.jobtitle ?? "")"
        favColor.text = "FavouriteColor: \(people?.favouriteColor ?? "")"
        userImg.loadThumbnail(urlSting: people?.avatar ?? "")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
