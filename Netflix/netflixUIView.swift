//
//  UIView.swift
//  TMDB
//
//  Created by 나리강 on 2022/08/09.
//

import UIKit

class netflixUIView : UIView {


    
    @IBOutlet weak var posterImageView: UIImageView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        let view = UINib(nibName: "netflixUIView", bundle: nil).instantiate(withOwner: self).first as! UIView
        view.frame = bounds
        view.backgroundColor = .black
        self.addSubview(view)
        view.layer.cornerRadius = 10
        
        
        
    }
    
    
    
    
    
}
