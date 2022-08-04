//
//  ViewController.swift
//  TMDB
//
//  Created by 나리강 on 2022/08/03.
//

import UIKit

import Alamofire
import SwiftyJSON


class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getMovieInfo()
    }


    
    
    
    
    
    func getMovieInfo() {
      
        let url = Endpoint.movieURL + APIKey.Movie


        AF.request(url, method: .get).validate(statusCode: 200...500).responseJSON { [self] response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")


            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
    
}

