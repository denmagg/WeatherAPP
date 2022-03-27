//
//  SwitchTemperatureButton.swift
//  WeatherAPP
//
//  Created by Денис Медведев on 24.03.2022.
//

import UIKit

class SwitchTemperatureButton: UIButton {
    
    enum Consts {
        static let darkAlpha: CGFloat = 0.6
        static let brightAlpha: CGFloat = 1
        static let celsuisLabelText = "℃"
        static let fahrenheitLabelText = "℉"
        static let slashLabelLabelText = " / "
    }
    
    let celsuisLabel = UILabel()
    let slashLabel = UILabel()
    let fahrenheitLabel = UILabel()
    //Boolean, true means - degrees Celsius. false means - degrees Fahrenheit
    var isCelsius = true {
        willSet(newValue) {
            if newValue == true {
                celsuisLabel.alpha = Consts.brightAlpha
                fahrenheitLabel.alpha = Consts.darkAlpha
            } else {
                celsuisLabel.alpha = Consts.darkAlpha
                fahrenheitLabel.alpha = Consts.brightAlpha
            }
        }
    }
    
    init(isCelsius: Bool) {
        super.init(frame: CGRect.zero)
        
        setupSubviews()
        configurateSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        self.addSubview(celsuisLabel)
        self.addSubview(slashLabel)
        self.addSubview(fahrenheitLabel)
    }
    
    private func configurateSubviews() {
        celsuisLabel.text = Consts.celsuisLabelText
        
        slashLabel.text = Consts.slashLabelLabelText
        slashLabel.alpha = Consts.darkAlpha
        
        fahrenheitLabel.text = Consts.fahrenheitLabelText
        
        if isCelsius == false {
            celsuisLabel.alpha = Consts.darkAlpha
            fahrenheitLabel.alpha = Consts.brightAlpha
        } else {
            celsuisLabel.alpha = Consts.brightAlpha
            fahrenheitLabel.alpha = Consts.darkAlpha
        }
    }
    
    private func setupConstraints() {
        slashLabel.translatesAutoresizingMaskIntoConstraints = false
        slashLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        slashLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        fahrenheitLabel.translatesAutoresizingMaskIntoConstraints = false
        fahrenheitLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        fahrenheitLabel.leadingAnchor.constraint(equalTo: slashLabel.trailingAnchor).isActive = true
        
        celsuisLabel.translatesAutoresizingMaskIntoConstraints = false
        celsuisLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        celsuisLabel.trailingAnchor.constraint(equalTo: slashLabel.leadingAnchor).isActive = true
    }

}
