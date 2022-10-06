//
//  CustomMainViewController.swift
//  LandMarkVisitor
//
//  Created by 이송은 on 2022/08/23.
//

import UIKit
class CustomMainCell : UITableViewCell {
    
    @IBOutlet weak var CustomMainLabel: UILabel!
}

class CustomMainViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource{

    struct CustomMainDataModel{
        
        var description : String
        var isExpand : Bool
    }
    
    var dataModels = [CustomMainDataModel]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomMainCell_ID", for: indexPath) as! CustomMainCell
        
        cell.CustomMainLabel.text = dataModels[indexPath.row].description
        
        if dataModels[indexPath.row].isExpand == true {
            cell.CustomMainLabel.numberOfLines = 0
        }else{
            cell.CustomMainLabel.numberOfLines = 1
        }
        
        cell.selectionStyle = .none
        return cell
    }


    let CustomMainArray = ["부산","서울","제주"]
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataModels[indexPath.row].isExpand = !dataModels[indexPath.row].isExpand
        
        tableView.reloadRows(at: [indexPath], with: .none)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        for (_,value) in CustomMainArray.enumerated() {
            dataModels.append(CustomMainDataModel.init(description: value, isExpand: false))
        }
     
    }
}
