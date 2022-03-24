//
//  ScrollViewDelegate.swift
//  WeatherAPP
//
//  Created by Денис Медведев on 22.03.2022.
//

import UIKit

protocol WeatherScrollViewDelegate: AnyObject {
    func getViewWidth() -> CGFloat
    func updatePageControlIndex(to index: Int)
}

class ScrollViewDelegate: NSObject, UIScrollViewDelegate {
    
    var delegate: WeatherScrollViewDelegate?
    
    init(withDelegate delegate: WeatherScrollViewDelegate) {
        self.delegate = delegate
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let viewWidth = delegate?.getViewWidth() else { return }
        let pageIndex = Int(round(scrollView.contentOffset.x / viewWidth))
        delegate?.updatePageControlIndex(to: pageIndex)
    }
}
