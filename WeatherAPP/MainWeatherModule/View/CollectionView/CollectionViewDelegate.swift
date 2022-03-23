//
//  CollectionViewDelegate.swift
//  WeatherAPP
//
//  Created by Денис Медведев on 19.03.2022.
//

import UIKit

protocol WeatherCollectionViewDelegate: AnyObject {
    func selectedItem(number: Int)
}

class CollectionViewDelegate: NSObject, UICollectionViewDelegate {
    // #1
    weak var delegate: WeatherCollectionViewDelegate?
    
    // #2
    init(withDelegate delegate: WeatherCollectionViewDelegate) {
        self.delegate = delegate
    }
    
    // #3
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.selectedItem(number: indexPath.row)
    }
}
