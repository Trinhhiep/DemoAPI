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
        
        
    }
    
    func updateUI(_ url : String) {
        img.load(link: url)
       
    }
}
//  load image from link
extension UIImageView {
   
    func load(link: String){
        guard let url = URL(string: link) else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
        
       
    }
}
