//
//  CollectionViewFlowLayout.swift
//  WeatherAPP
//
//  Created by Денис Медведев on 21.03.2022.
//

import UIKit

class CollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        
        self.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        self.itemSize = CGSize(width: 60, height: 80)
        self.scrollDirection = .horizontal
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
