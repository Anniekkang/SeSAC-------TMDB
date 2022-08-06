//
//  SearchViewController.swift
//  TMDB
//
//  Created by 나리강 on 2022/08/06.
//

import UIKit

class SearchViewController: UIViewController {

    
    @IBOutlet weak var searchCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchCollectionView.delegate =  self
        searchCollectionView.dataSource = self
        
       
    }
    

    

}

extension SearchViewController : UICollectionViewDelegate, UICollectionViewDataSource {
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
    
    
    
}
