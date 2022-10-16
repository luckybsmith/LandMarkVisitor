//
//  JejuDetailViewController.swift
//  LandMarkVisitor
//
//  Created by 이송은 on 2022/08/19.
//

import UIKit
class JejuAreaCell : UITableViewCell{
    
    @IBOutlet weak var JejuAreaLabel: UILabel!
}

class JejuAreaViewController: UIViewController  , UITableViewDelegate , UITableViewDataSource{
    
    struct JejuAreaDataModel{
        var description : String
        var isExpand : Bool
    }
    
    var dataModels = [JejuAreaDataModel]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JejuAreaCell_ID", for: indexPath) as! JejuAreaCell
        
        cell.JejuAreaLabel.text = dataModels[indexPath.row].description
        
        if dataModels[indexPath.row].isExpand == true {
            cell.JejuAreaLabel.numberOfLines = 0
        }else{
            cell.JejuAreaLabel.numberOfLines = 1
        }
        
        cell.selectionStyle = .none
        return cell
    }
    let textArray = ["제주시" , "애월읍" , "한림읍" , "한경면" , "대정읍" , "안덕면" , "중문" , "서귀포" , "남원읍" , "표선면", "성산읍" , "구좌읍" , "조천읍" , "우도"]
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataModels[indexPath.row].isExpand = !dataModels[indexPath.row].isExpand
        
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for (_,value) in textArray.enumerated() {
            dataModels.append(JejuAreaDataModel.init(description: value, isExpand: false))
        }

    }
}
