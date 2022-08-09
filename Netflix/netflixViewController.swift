//
//  MainViewController.swift
//  TMDB
//
//  Created by 나리강 on 2022/08/09.
//

import UIKit

class netflixViewController: UIViewController {

    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    let labelList = ["아는 와이프와 비슷한 콘텐츠", "미스터 선샤인과 비슷한 콘텐츠","액션 SF","미국 TV 프로그램"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    
        
        
        
    }
    

    
    
    
}

extension netflixViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return 5
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "netflixCollectionViewCell", for: indexPath) as? netflixCollectionViewCell else { return UICollectionViewCell()}
        
        
        
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return 1
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "netflixTableViewCell", for: indexPath) as? netflixTableViewCell else { return UITableViewCell() }
        
        
        cell.titleLabel.text = labelList[indexPath.row]
        cell.collectionView.delegate = self
        cell.collectionView.dataSource = self
        cell.collectionView.backgroundColor = .yellow
        cell.backgroundColor = .black
        cell.collectionView.register(UINib(nibName: "netflixCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "netflixCollectionViewCell")
        
        
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 220
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return labelList.count
        
    }
    
    
    
    
}
