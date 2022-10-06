//
//  SeoulAreaViewController.swift
//  LandMarkVisitor
//
//  Created by 이송은 on 2022/08/22.
//

import UIKit

class SeoulAreaCell : UITableViewCell {
    @IBOutlet weak var SeoulAreaLabel: UILabel!
    
}
class SeoulAreaViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource{
    
    struct SeoulAreaDataModel{
        var description : String
        var isExpand : Bool
    }
    
    var dataModels = [SeoulAreaDataModel]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SeoulAreaCell_ID", for: indexPath) as! SeoulAreaCell
        
        cell.SeoulAreaLabel.text = dataModels[indexPath.row].description
        
        if dataModels[indexPath.row].isExpand == true {
            cell.SeoulAreaLabel.numberOfLines = 0
        }else{
            cell.SeoulAreaLabel.numberOfLines = 1
        }
        
        cell.selectionStyle = .none
        return cell
    }

    
    var SeoulAreaArray = ["종로구","중구","용산구","성동구","광진구",
                          "동대문구","중랑구","성북구", "강북구","도봉구",
                          "노원구","은평구","서대문구","마포구",
                          "양천구", "강서구", "구로구", "금천구",
                          "영등포구","동작구", "관악구","서초구",
                          "강남구", "송파구","강동구"]
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataModels[indexPath.row].isExpand = !dataModels[indexPath.row].isExpand
        
        tableView.reloadRows(at: [indexPath], with: .none)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        for (_,value) in SeoulAreaArray.enumerated() {
            dataModels.append(SeoulAreaDataModel.init(description: value, isExpand: false))
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
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//            
//            if editingStyle == .delete {
//                
//                SeoulAreaArray.remove(at: indexPath.row)
//                tableView.deleteRows(at: [indexPath], with: .fade)
//                
//            } else if editingStyle == .insert {
//                
//            }
//        }
}
