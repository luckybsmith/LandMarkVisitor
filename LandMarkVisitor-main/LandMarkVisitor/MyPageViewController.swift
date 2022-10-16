//
//  MyPageViewController.swift
//  LandMarkVisitor
//
//  Created by Leesongeun on 2022/10/15.
//

import UIKit
class MyPageCell : UITableViewCell {
    
    @IBOutlet weak var lblName: UILabel!
}
class MyPageViewController: UIViewController {
    
    var ArrayList = ["day 1", "day 2"]
    struct MypageDataModel{
        var description : String
        var isExpand : Bool
    }
    
    var dataModel = [MypageDataModel]()

    override func viewDidLoad() {
        super.viewDidLoad()

        for (_,value) in ArrayList.enumerated() {
            dataModel.append(MypageDataModel.init(description: value, isExpand: false))
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataModel[indexPath.row].isExpand = !dataModel[indexPath.row].isExpand
        tableView.reloadRows(at: [indexPath], with: .none)
    }

}

extension MyPageViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyPageCell", for: indexPath) as! MyPageCell
        
        cell.lblName.text = dataModel[indexPath.row].description
        
        if dataModel[indexPath.row].isExpand == true {
            cell.lblName.numberOfLines = 0
        }else{
            cell.lblName.numberOfLines = 1
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
}
