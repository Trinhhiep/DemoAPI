//
//  TableViewCell.swift
//  DemoAPI
//
//  Created by Admin on 18/04/2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblFirstFlight: UILabel!
    @IBOutlet weak var lblCountry: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func updateUI(_ rocket : Rocket)  {
        lblName.text = rocket.name
        lblFirstFlight.text = rocket.firstFlight
        lblCountry.text = rocket.country
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
