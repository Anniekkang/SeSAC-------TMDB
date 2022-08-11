//
//  MainViewController.swift
//  TMDB
//
//  Created by 나리강 on 2022/08/09.
//

import UIKit

import Kingfisher

class netflixViewController: UIViewController {

   
   
  
    
    var titleList : [String] = []
    var recommendList : [[String]] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    
        netflixAPIManager.shared.recommendRequest { value in
            self.recommendList = value
            
        } completionHandler2: { value in
            self.titleList = value
            dump(value)
        }
            self.tableView.reloadData()
        }

        
        
    }


extension netflixViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return recommendList[collectionView.tag].count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "netflixCollectionViewCell", for: indexPath) as? netflixCollectionViewCell else { return UICollectionViewCell()}
        
      
        let url = URL(string:"https://image.tmdb.org/t/p/w500 + \(netflixAPIManager.shared.imagePath[indexPath.section][indexPath.row])")
        
        cell.netflixUIView.posterImageView.kf.setImage(with: url)
        
        
        return cell
        
    }
    
    //이건뭔지모르겠음
    func collectionViewLayout() -> UICollectionViewFlowLayout {


        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.8)
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        layout.collectionView?.backgroundColor = .green
        return layout

    }



    
}

extension netflixViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return titleList.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "netflixTableViewCell", for: indexPath) as? netflixTableViewCell else { return UITableViewCell() }
        
    
      
        cell.collectionView.delegate = self
        cell.collectionView.dataSource = self
        cell.collectionView.backgroundColor = .black
        cell.backgroundColor = .black
        cell.collectionView.register(UINib(nibName: "netflixCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "netflixCollectionViewCell")
        cell.collectionView.tag = indexPath.section
        cell.titleLabel.text = titleList[indexPath.section]
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 220
        
        
    }
    
    
}
