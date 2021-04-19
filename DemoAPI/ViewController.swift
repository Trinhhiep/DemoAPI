//
//  ViewController.swift
//  DemoAPI
//
//  Created by Admin on 18/04/2021.
//

import UIKit

class ViewController: UIViewController {
    var rockets : [Rocket]?
    let url = URL(string: "https://api.spacexdata.com/v4/rockets")
    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        
        fetchData(url: url!) {(data : [Rocket]) in
            DispatchQueue.main.async{
                self.rockets = data
                self.myTableView.reloadData()
            }
            
        }
        
    }
    
}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rockets?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL") as! TableViewCell
        
        cell.updateUI(rockets![indexPath.row])
        
        return cell
    }
    
    
}
extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let detail = sb.instantiateViewController(withIdentifier: "DETAILSB") as! DetailViewController
        detail.images = rockets![indexPath.row].flickrImages
        print("clicked")
        self.navigationController?.pushViewController(detail, animated: true)
    }
}
extension UIViewController {
    
    // keyword @escaping của closure giúp ta giữ closure ko bị giải phóng khi function kết thúc
    func fetchData(url : URL, _ completion : @escaping ([Rocket]) -> Void) {
        
        let task = URLSession.shared.dataTask(with: url) {
            ( data, response, error) in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            
            do{
                let objs = try! decoder.decode([Rocket].self, from: data)
                
                completion(objs)
            }
        }
        task.resume()
    }
}
