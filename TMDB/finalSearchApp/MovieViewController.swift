//
//  MovieViewController.swift
//  TMDB
//
//  Created by 나리강 on 2022/08/08.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher


class MovieViewController : UIViewController {
   

    @IBOutlet weak var movieCollectionView: UICollectionView!



    var movieList : [MovieModel] = []
    var startPage = 1
    var totalCount = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
        movieCollectionView.prefetchDataSource = self
        
        
        movieCollectionView.register(UINib(nibName: MovieCollectionViewCell.reuseblaIdentifier, bundle: nil), forCellWithReuseIdentifier: MovieCollectionViewCell.reuseblaIdentifier)
        
        fatchMovie()
        designNavibar()
        collectionViewLayout()
    }
    
    
    func designNavibar() {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.triangle"), style: .plain, target: nil, action: nil)
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: nil, action: nil)
        }
        
    

    func fatchMovie(){
        
        
        let url = Endpoint.movieURL + APIKey.APIMovie + "&page=\(startPage)"
        
        AF.request(url, method: .get).validate(statusCode: 200...500).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                self.totalCount = json["total_pages"].intValue
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
                    
                    let data = MovieModel(date: release_date, genre: genre_ids, image: poster_path, title: title, overview: overview, rate: round(vote_average * 10) / 10, id: id)
                    
                    self.movieList.append(data)
                    
                    
                    
                }

            self.movieCollectionView.reloadData()
                
            case .failure(let error):
                print(error)
            }
        }
        
       
    
    

    }
        
        
        
        
}
    
    
    
    
    



extension MovieViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as! MovieCollectionViewCell
        
        cell.dateLabel.text = movieList[indexPath.item].date
    
        
        let imageURL = URL(string: Endpoint.imageURL + movieList[indexPath.item].image
        )

        cell.posterImageView.kf.setImage(with: imageURL)
        cell.titleLabel.text = movieList[indexPath.item].title
        cell.overviewLabel.text = movieList[indexPath.item].overview
        cell.dateLabel.text = movieList[indexPath.item].date
        
        cell.titleLabel.backgroundColor = .white
        cell.genreLabel.backgroundColor = .white
        cell.dateLabel.backgroundColor = .white
        
        
  
        print(movieList[indexPath.item].title)
        
        cell.dateLabel.backgroundColor = .white
        cell.genreLabel.backgroundColor = .white
        cell.posterImageView.layer.cornerRadius = 10
        cell.layer.shadowColor = UIColor.darkGray.cgColor
        cell.layer.opacity = 0.5
        cell.layer.shadowRadius = 15
        
        return cell
        
    }

    
}

extension MovieViewController {
    
    func collectionViewLayout() {
        
        let layout = UICollectionViewFlowLayout()
        
        let spacing: CGFloat = 60
        
        let width = UIScreen.main.bounds.width - (spacing * 2)
        
        layout.itemSize = CGSize(width: width , height: width * 1.2 )
        
        layout.scrollDirection = .vertical
        
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        
        layout.minimumLineSpacing = spacing * 3
        layout.minimumInteritemSpacing = spacing * 3
        
        movieCollectionView.collectionViewLayout = layout
        
    }
    
}

//pagenation
extension MovieViewController : UICollectionViewDataSourcePrefetching {
  
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            
            if movieList.count - 1 == indexPath.item && movieList.count < totalCount {
                
                startPage += 1
                fatchMovie()
                
            }
            
        }

    }

}


