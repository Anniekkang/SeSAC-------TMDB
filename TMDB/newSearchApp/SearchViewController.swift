//
//  SearchViewController.swift
//  TMDB
//
//  Created by 나리강 on 2022/08/06.
//

import UIKit

import Alamofire
import SwiftyJSON
import Kingfisher

class SearchViewController: UIViewController {

    var movieList : [Model] = []
    
    @IBOutlet weak var searchCollectionView: UICollectionView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nibName = UINib(nibName: SearchCollectionViewCell.identifier, bundle: nil)
        searchCollectionView.register(nibName, forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
        
        
        searchCollectionView.delegate =  self
        searchCollectionView.dataSource = self
        
        getInfo()
        collectionViewLayout()
        
        self.searchCollectionView.reloadData()
    }
    

    
    func getInfo(){
        
        
        let url = Endpoint.movieURL + APIKey.APIMovie
        
        AF.request(url, method: .get).validate(statusCode: 200...500).responseData(queue: .global()) { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
               // print("JSON: \(json)")

               // let totalcount = json["total"].intValue
                
//                for item in json["items"].arrayValue {
//                    //20개의 셀
//                    //셀에서 URL, UIImage변환을 할건지
//                    //서버통신 지점에서 변환을 할건지 -> 시간 오래걸림
//
//                   self.list.append(item["link"].stringValue)
//
//                }
                
               // let list = json["item"].arrayValue.map { $0["link"].stringValue  }

                for item in json["results"] {
                    let poster_path = item.1["poster_path"].stringValue
                    let release_date = item.1["release_date"].stringValue
                    let overview = item.1["overview"].stringValue
                    let title = item.1["original_title"].stringValue
                    let genre_ids = item.1["genre_ids"][0].intValue
                    let vote_average = item.1["vote_average"].doubleValue
                    let id = item.1["id"].intValue
                    let data = Model(date: release_date, genre: genre_ids, ImageURL: poster_path, title: title, overview: overview, rate: round(vote_average * 10) / 10, id: id)
                    
                    self.movieList.append(data)
                    
                    
                }
                
                self.searchCollectionView.reloadData()
                
            case .failure(let error):
                print(error)
            }
        }

    }
    

}

    



extension SearchViewController : UICollectionViewDelegate, UICollectionViewDataSource {
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifier, for: indexPath) as! SearchCollectionViewCell
        
        cell.dataLabel.text = movieList[indexPath.item].date
        
        let imageURL = URL(string: "https://api.themoviedb.org/3/movie/{\(movieList[indexPath.item].id)}/images?api_key=\(APIKey.APIMovie)&language=en-US")
        

        cell.posterImageView.kf.setImage(with: imageURL)
        cell.titleLabel.text = movieList[indexPath.item].title
        cell.overviewLabel.text = movieList[indexPath.item].overview
        cell.dataLabel.text = movieList[indexPath.item].date
        
  
        print(movieList[indexPath.item].title)
        return cell
        
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//
//        let sb =  UIStoryboard(name: "Main", bundle: nil)
//        let vc = sb.instantiateViewController(withIdentifier: searchCollectionView.)
//
//
//
//    }
//
    
    
    
    
}


extension SearchViewController {
    
    func collectionViewLayout() {
        
        let layout = UICollectionViewFlowLayout()
        
        let spacing: CGFloat = 24
        
        let width = UIScreen.main.bounds.width - (spacing * 2)
        
        layout.itemSize = CGSize(width: width , height: width * 1.2 )
        
        layout.scrollDirection = .vertical
        
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        
        layout.minimumLineSpacing = spacing * 3
        layout.minimumInteritemSpacing = spacing * 3
        
        searchCollectionView.collectionViewLayout = layout
    }
    
}
