//
//  JeJuAreaDetailViewController.swift
//  LandMarkVisitor
//
//  Created by 이송은 on 2022/08/19.
//

import UIKit
class JejuAreaDetailCell : UITableViewCell {
    //카페 식당 관광명소
    @IBOutlet weak var DetailLabel: UILabel!
}
class JeJuAreaDetailViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{

    @IBOutlet weak var AreaImage: UIImageView!
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for (_,value) in textArray.enumerated() {
            dataModels.append(JejuDetailAreaDataModel.init(description: value, isExpand: false))
        }
        
    
        // Do any additional setup after loading the view.
    }
    
    
    struct JejuDetailAreaDataModel{
        var description : String
        var isExpand : Bool
    }
    
    var dataModels = [JejuDetailAreaDataModel]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JejuDetailAreaID", for: indexPath) as! JejuAreaDetailCell
        
        cell.DetailLabel.text = dataModels[indexPath.row].description
        
        if dataModels[indexPath.row].isExpand == true {
            cell.DetailLabel.numberOfLines = 0
        }else{
            cell.DetailLabel.numberOfLines = 1
        }
        
        cell.selectionStyle = .none
        return cell
    }
  
    let textArray = ["숙성도 애월점" , "애파소", "지금이순간" , "아르떼뮤지엄","후카후카" , "인디안썸머애월" , "봄날","숙성도 애월점" , "애파소", "지금이순간" , "아르떼뮤지엄","후카후카" , "인디안썸머애월" , "봄날","숙성도 애월점" , "애파소", "지금이순간" , "아르떼뮤지엄","후카후카" , "인디안썸머애월" , "봄날"]

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataModels[indexPath.row].isExpand = !dataModels[indexPath.row].isExpand
        
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
}
