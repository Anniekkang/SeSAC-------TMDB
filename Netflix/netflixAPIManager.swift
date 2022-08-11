//
//  netflixAPIManager.swift
//  TMDB
//
//  Created by 나리강 on 2022/08/11.
//

import UIKit

import Alamofire
import SwiftyJSON


class netflixAPIManager {
    
    static let shared = netflixAPIManager()
    
    private init(){}

    var movieDic : [String : Int] = [:]
    var movieList : [[String : Int]] = [[:]]
    
    func dictionaryRequest(){
        
        let url = "https://api.themoviedb.org/3/trending/movie/week?api_key=\(APIKey.APIMovie)"
        AF.request(url, method: .get).validate(statusCode: 200...500).responseData { [self] response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
               // print(json)
                
                
                //title값 key에 저장, id값 value에 저장
                for item in json["results"].arrayValue {

                    let key = item["title"].stringValue[IndexPath]
                    let value = item["id"].intValue

                    movieDic.updateValue(value, forKey: key)
                    movieList.append(movieDic)
                    
                }
                
                print(movieList)
                
//                let key = json["result"].arrayValue.map { $0["title"].stringValue}
//                let value = json["result"].arrayValue.map { $0["id"].intValue}
                
          
            case .failure(let error):
                print("error")
            }

    }
    
    
    func recommendRequest(query : Int, completionHandler : @escaping ([String]) -> () ){
        print(#function)
   
        let url = "https://api.themoviedb.org/3/movie/\(query)/recommendations?api_key=\(APIKey.APIMovie)&language=en-US&page=1"
     
        AF.request(url, method: .get).validate(statusCode: 200...500).responseData { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
            
                var stillArray : [String] = []
                for list in json["episodes"].arrayValue {

                    let value = list["still_path"].stringValue
                    stillArray.append(value)

                }
                
                let value = json["episodes"].arrayValue.map { $0["still_path"].stringValue }
                
                
                completionHandler(value)
                
            case .failure(let error):
                print(error)
            }
    
    
    

        }


    }
    
    
    
    
    
    

    }
}
