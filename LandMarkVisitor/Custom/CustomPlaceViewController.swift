//
//  CustomPlaceViewController.swift
//  LandMarkVisitor
//
//  Created by 이송은 on 2022/08/24.
//

import UIKit
class placeCell : UITableViewCell {
    
    @IBOutlet weak var placeLabel: UILabel!
}
class CustomPlaceViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource{

    struct PlaceModel{
        var description : String
        var isExpand : Bool
    }
    
    var dataModels = [PlaceModel]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomPlaceCell", for: indexPath) as! placeCell
        
        cell.placeLabel.text = dataModels[indexPath.row].description
        
        if dataModels[indexPath.row].isExpand == true {
            cell.placeLabel.numberOfLines = 0
        }else{
            cell.placeLabel.numberOfLines = 1
        }
        
        cell.selectionStyle = .none
        return cell
    }
    let PlaceArray = ["숙성도 애월점" , "애파소", "지금이순간" , "아르떼뮤지엄","후카후카" , "인디안썸머애월" , "봄날","숙성도 애월점" , "애파소", "지금이순간" , "아르떼뮤지엄","후카후카" , "인디안썸머애월" , "봄날","숙성도 애월점" , "애파소", "지금이순간" , "아르떼뮤지엄","후카후카" , "인디안썸머애월" , "봄날"]
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataModels[indexPath.row].isExpand = !dataModels[indexPath.row].isExpand
        
        tableView.reloadRows(at: [indexPath], with: .none)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        for (_,value) in PlaceArray.enumerated() {
            dataModels.append(PlaceModel.init(description: value, isExpand: false))
        }
     
    }
}
