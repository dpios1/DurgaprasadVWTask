//
//  PeopleTableViewCell.swift
//  DurgaprasadTask
//
//  Created by SPURGE on 23/03/22.
//

import UIKit

class PeopleTableViewCell: UITableViewCell {

    @IBOutlet weak var role: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var userImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func initPeopeData(_ people:People){
        name.text =  people.firstName + " " + people.lastName
        email.text = people.email
        role.text = people.jobtitle
        userImg.loadThumbnail(urlSting: people.avatar)
    }
}
