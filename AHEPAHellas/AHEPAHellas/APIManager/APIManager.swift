//
//  APIManager.swift
//  AHEPAHellas
//
//  Created by Angelos Staboulis on 29/4/21.
//  Copyright © 2021 Angelos Staboulis. All rights reserved.
//

import Foundation
import Alamofire
import SWXMLHash
class APIManager{
    static let shared = APIManager()
    private init(){}
    func listRSS(completion:@escaping ([RSSModel])->()){
            let urlMain = URL(string: "http://ahepahellas.org/feed/")
            let request = URLRequest(url: urlMain!)
            AF.request(request).responseString { (dataResponse) in
                let xml = SWXMLHash.parse(dataResponse.data!)
                var rssArray:[RSSModel]=[]
                for item in 0..<xml["rss"]["channel"]["item"].all.count{
                    let rss = RSSModel(title: xml["rss"]["channel"]["item"][item]["title"].element?.text, link: xml["rss"]["channel"]["item"][item]["link"].element?.text)
                    rssArray.append(rss)
                }
                completion(rssArray)
               
            }
            
            
      
    }
}
