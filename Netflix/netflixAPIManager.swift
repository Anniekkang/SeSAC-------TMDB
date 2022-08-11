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

    var keyArray : [String] = []
    var valueArray : [Int] = []
    var imagePath : [[String]] = [] //path들이 있는 배열
    var movieID : [Int] = []
    var movieTitle : [String] = []
    
     
    
    
    //key = title, value = id -> save
    func arrayRequest(completionHandler: @escaping ([String]) -> (),completionHandler2: @escaping ([Int]) -> ()) {
        
       
        let url = "https://api.themoviedb.org/3/trending/movie/week?api_key=\(APIKey.APIMovie)"
        AF.request(url, method: .get).validate(statusCode: 200...500).responseData { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
               // print(json)
                
                
                //title값 key에 저장, id값 value에 저장
                for item in json["results"].arrayValue {

                    let key = item["title"].stringValue
                    let value = item["id"].intValue

                    self.keyArray.append(key)
                    self.valueArray.append(value)
                   
                }
                
            
                print(self.keyArray)
                print(self.valueArray)
                print(self.keyArray.count)
            
                completionHandler(self.keyArray)
                completionHandler2(self.valueArray)
               
                
//                let key = json["result"].arrayValue.map { $0["title"].stringValue}
//                let value = json["result"].arrayValue.map { $0["id"].intValue}
                
          
            case .failure(let error):
                print(error)
            }

    }
    
}
    
    func recommendRequest(completionHandler: @escaping ([[String]]) -> (),completionHandler2: @escaping ([String])->()) {
    
        
       
        
        arrayRequest { key in
            self.movieTitle.append(contentsOf: key)
        } completionHandler2: { value in
            self.movieID.append(contentsOf: value)
        }


        let url = "https://api.themoviedb.org/3/movie/\(movieID)/recommendations?api_key=\(APIKey.APIMovie)&language=en-US&page=1"
     
        AF.request(url, method: .get).validate(statusCode: 200...500).responseData { [self] response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                var Array : [String] = []
                
                for list in json["results"].arrayValue {
                   
                    //추천영화 이미지 경로
                    let value = list["poster_path"].stringValue
                    Array.append(value)
                    

                }
                
                imagePath.append(Array)
                completionHandler(self.imagePath)
                
                
                
                
            case .failure(let error):
                print(error)
            }
    
    
    

        }


    }
    
    
    
    
    
    

    }

