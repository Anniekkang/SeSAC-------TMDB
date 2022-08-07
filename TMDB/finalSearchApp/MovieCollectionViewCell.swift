//
//  MovieCollectionViewCell.swift
//  TMDB
//
//  Created by 나리강 on 2022/08/08.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {

 
    static let identifier = "MovieCollectionViewCell"
    
    
    
    
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var rateLabel: UILabel!
    
    
    
    
}
