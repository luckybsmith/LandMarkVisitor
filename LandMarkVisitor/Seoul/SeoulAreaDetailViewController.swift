//
//  SeoulAreaDetailViewController.swift
//  LandMarkVisitor
//
//  Created by 이송은 on 2022/08/22.
//

import UIKit
class SeoulAreaDetailCell : UITableViewCell {
    
    @IBOutlet weak var SeoulAreaDetailLabel: UILabel!
}
class SeoulAreaDetailViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource{

    @IBOutlet weak var SeoulAreaDetailImage: UIImageView!
    
    struct SeoulAreaDetailDataModel{
        var description : String
        var isExpand : Bool
    }
    
    var dataModels = [SeoulAreaDetailDataModel]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SeoulAreaDetailCell_ID", for: indexPath) as! SeoulAreaDetailCell
        
        cell.SeoulAreaDetailLabel.text = dataModels[indexPath.row].description
        
        if dataModels[indexPath.row].isExpand == true {
            cell.SeoulAreaDetailLabel.numberOfLines = 0
        }else{
            cell.SeoulAreaDetailLabel.numberOfLines = 1
        }
        
        cell.selectionStyle = .none
        return cell
    }

    
    let SeouoAreaDetailArray = ["종로3가역"]
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataModels[indexPath.row].isExpand = !dataModels[indexPath.row].isExpand
        
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        for (_,value) in SeouoAreaDetailArray.enumerated() {
            dataModels.append(SeoulAreaDetailDataModel.init(description: value, isExpand: false))
        }
    }
   

}
