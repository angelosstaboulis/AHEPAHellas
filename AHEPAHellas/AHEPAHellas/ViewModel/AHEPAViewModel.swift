//
//  AHEPAViewModel.swift
//  AHEPAHellas
//
//  Created by Angelos Staboulis on 30/4/21.
//  Copyright © 2021 Angelos Staboulis. All rights reserved.
//

import Foundation
class AHEPAViewModel{
    init(list:[RSSModel]?=nil){
        if let getList = list {
            rssList = getList
        }
    }
    var rssList:[RSSModel]=[]
    
    func fetchRSSList(completion:@escaping ([RSSModel])->()){
        APIManager.shared.listRSS { array in
            self.rssList = array
            completion(self.rssList)
        }
    }
}
