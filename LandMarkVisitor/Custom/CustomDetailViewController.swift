//
//  CustomDetailViewController.swift
//  LandMarkVisitor
//
//  Created by 이송은 on 2022/08/22.
//

import UIKit
class CustomDetailCell : UITableViewCell{
    @IBOutlet weak var CustomDetailLabel: UILabel!
    
}
class CustomDetailViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource{

    @IBOutlet weak var btnNavi: UIBarButtonItem!
    struct CustomDetailDataModel{
        var description : String
        var isExpand : Bool
    }
    
    var dataModels = [CustomDetailDataModel]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomDetailCell_ID", for: indexPath) as! CustomDetailCell
        
        cell.CustomDetailLabel.text = dataModels[indexPath.row].description
        
        if dataModels[indexPath.row].isExpand == true {
            cell.CustomDetailLabel.numberOfLines = 0
        }else{
            cell.CustomDetailLabel.numberOfLines = 1
        }
        
        cell.selectionStyle = .none
        return cell
    }
    let DetailArea = ["rk"]
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataModels[indexPath.row].isExpand = !dataModels[indexPath.row].isExpand
        
        tableView.reloadRows(at: [indexPath], with: .none)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        for (_,value) in DetailArea.enumerated() {
            dataModels.append(CustomDetailDataModel.init(description: value, isExpand: false))
        }
     
    }
    
    
    @IBAction func addclick(_ sender: Any) {
        print("add")
    }
}
