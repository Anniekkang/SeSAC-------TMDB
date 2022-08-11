//
//  ReusableProtocol.swift
//  TMDB
//
//  Created by 나리강 on 2022/08/11.
//

import UIKit

protocol ReusableProtocol {
    
    static var reuseIdentifier : String { get }
}
//extension 내에서는 저장프로퍼티 사용 불가
extension UICollectionViewCell : ReusableProtocol {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableView : ReusableProtocol {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
