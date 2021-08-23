//
//  BothOfUsNetwork.swift
//  AssignmentBothOfUs
//
//  Created by Angelos Staboulis on 23/8/21.
//

import Foundation
import Alamofire
import SwiftyJSON
class BothOfUsNetwork{
    static let shared = BothOfUsNetwork()
    private init(){}
    var rows:[BothOfUsModel]=[]
    func setRowBothOfUs(json:JSON,item:Int)->(BothOfUsModel){
        return BothOfUsModel(id: json["types"][item]["id"].stringValue, name: json["types"][item]["name"].stringValue, created_at: json["types"][item]["created_at"].stringValue, updated_at: json["types"][item]["updated_at"].stringValue, category: json["types"][item]["category"].intValue, active: json["types"][item]["active"].boolValue)
    }
    func fetchProductTypes(completion:@escaping ([BothOfUsModel])->()){
        let urlProductType = URL(string:bothOfUsUrl)
        let urlRequest = URLRequest(url: urlProductType!)
        AF.request(urlRequest).responseJSON { (dataResponse) in
            let json = JSON(dataResponse.value)
            for item in 0..<json["types"].count{
                self.rows.append(self.setRowBothOfUs(json: json, item: item))
            }
            completion(self.rows)
        }
    }
}
