//
//  CityView.swift
//  WeatherAPP
//
//  Created by Денис Медведев on 22.03.2022.
//

import UIKit

class CityView: UIView {
    
    init(frame: CGRect, color: UIColor) {
        super.init(frame: frame)
        self.backgroundColor = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
