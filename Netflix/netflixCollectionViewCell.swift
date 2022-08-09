//
//  netflixCollectionViewCell.swift
//  TMDB
//
//  Created by 나리강 on 2022/08/09.
//

import UIKit

class netflixCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var netflixUIView: netflixUIView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpUI()
        
       
    }

    func setUpUI(){
        
        
        netflixUIView.backgroundColor = .clear
        netflixUIView.posterImageView.layer.cornerRadius = 10
        
    }
    
    
    
}
