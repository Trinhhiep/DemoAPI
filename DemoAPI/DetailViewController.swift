//
//  DetailViewController.swift
//  DemoAPI
//
//  Created by Admin on 18/04/2021.
//

import UIKit

class DetailViewController: UIViewController {
    var images:[String]?
    @IBOutlet weak var DetailTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        DetailTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    


}
extension DetailViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DETAILCELL") as! DetailTableViewCell
        cell.updateUI(images![indexPath.row])
        return cell
    }
    
    
}
