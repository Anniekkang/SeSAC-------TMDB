//
//  MainTableViewCell.swift
//  TMDB
//
//  Created by 나리강 on 2022/08/09.
//

import UIKit

class netflixTableViewCell: UITableViewCell {

    

    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
        setUp()
        
        
    }

    func setUp(){
        
        
        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.textColor = .white
        titleLabel.backgroundColor = .clear
      
        collectionView.collectionViewLayout = collectionViewLayout()

        
    }
    
    //tabaleview안에 있는 collectionView의 layout
    func collectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 150)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        return layout
    }

}

