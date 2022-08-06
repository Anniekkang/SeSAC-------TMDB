//
//  SearchCollectionViewCell.swift
//  TMDB
//
//  Created by 나리강 on 2022/08/06.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {

  static let identifier = "SearchCollectionViewCell"
    
    
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    @IBOutlet weak var videoButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
}
