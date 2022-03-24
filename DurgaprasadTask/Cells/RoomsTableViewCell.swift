//
//  RoomsTableViewCell.swift
//  DurgaprasadTask
//
//  Created by SPURGE on 24/03/22.
//

import UIKit

class RoomsTableViewCell: UITableViewCell {
    @IBOutlet weak var createdAt: UILabel!
    
    @IBOutlet weak var maxOccupancy: UILabel!
    @IBOutlet weak var lbl_occupy: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func initRoomData(_ room:Rooms){
        createdAt.text =   "CreatedAt: \(room.createdAt)"
        lbl_occupy.text = "IsOccupied: \(room.isOccupied)"
        maxOccupancy.text = "maxOccupancy: \(room.maxOccupancy)"
    }
    
}
