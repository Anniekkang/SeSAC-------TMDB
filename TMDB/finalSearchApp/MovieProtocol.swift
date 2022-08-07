//
//  MovieProtocol.swift
//  TMDB
//
//  Created by 나리강 on 2022/08/08.
//

import UIKit


protocol ReusableViewProtocol {
    static var reuseblaIdentifier : String { get }
    
    
}

extension UIViewController : ReusableViewProtocol {
    static var reuseblaIdentifier: String {
        return String(describing: self)
    }
    
}

extension UICollectionViewCell : ReusableViewProtocol {
    static var reuseblaIdentifier: String {
        return String(describing: self)
    }
    
    
}
