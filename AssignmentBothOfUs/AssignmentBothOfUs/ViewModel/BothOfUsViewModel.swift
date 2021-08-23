//
//  BothOfUsViewModel.swift
//  AssignmentBothOfUs
//
//  Created by Angelos Staboulis on 23/8/21.
//

import Foundation
class BothOfUsViewModel{
    var apishared:BothOfUsNetwork
    var rows:[BothOfUsModel]=[]
    init(){
        apishared = BothOfUsNetwork.shared
    }
    func fetchProductTypes(completion:@escaping ([BothOfUsModel])->()){
        apishared.fetchProductTypes { (array) in
            self.rows.append(contentsOf: array)
            completion(self.rows)
        }
    }
}
