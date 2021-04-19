//
//  DetailTableViewCell.swift
//  DemoAPI
//
//  Created by Admin on 18/04/2021.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateUI(_ url : String){
        
    }
}
