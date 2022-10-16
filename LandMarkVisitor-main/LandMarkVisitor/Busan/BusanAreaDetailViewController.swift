//
//  BusanAreaDetailViewController.swift
//  LandMarkVisitor
//
//  Created by 이송은 on 2022/08/22.
//

import UIKit
class BusanAreaDetailCell : UITableViewCell {
    
    @IBOutlet weak var BusanAreaDetailLabel: UILabel!
}
class BusanAreaDetailViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource{
    
    @IBOutlet weak var BusanDetailImage: UIImageView!
    
    struct BusanAreaDetailDataModel{
        var description : String
        var isExpand : Bool
    }
    
    var dataModels = [BusanAreaDetailDataModel]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BusanAreaDetailCell_ID", for: indexPath) as! BusanAreaDetailCell
        
        cell.BusanAreaDetailLabel.text = dataModels[indexPath.row].description
        
        if dataModels[indexPath.row].isExpand == true {
            cell.BusanAreaDetailLabel.numberOfLines = 0
        }else{
            cell.BusanAreaDetailLabel.numberOfLines = 1
        }
        
        cell.selectionStyle = .none
        return cell
    }


    let BusanArea = ["중구","동구","서구","영도구","부산진구"
                     ,"동래구","연제구","금정구","북구","사상구"
                     ,"사하구","강서구","남구","해운대구","수영구","기장군"]
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataModels[indexPath.row].isExpand = !dataModels[indexPath.row].isExpand
        
        tableView.reloadRows(at: [indexPath], with: .none)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        for (_,value) in BusanArea.enumerated() {
            dataModels.append(BusanAreaDetailDataModel.init(description: value, isExpand: false))
        }
    
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
