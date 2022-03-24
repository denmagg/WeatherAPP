//
//  SwitchTemperatureButton.swift
//  WeatherAPP
//
//  Created by Денис Медведев on 24.03.2022.
//

import UIKit

class SwitchTemperatureButton: UIButton {
    
    let celsuisLabel = UILabel()
    let slashLabel = UILabel()
    let fahrenheitLabel = UILabel()
    //Boolean, true means - degrees Celsius. false means - degrees Fahrenheit
    var isCelsius = true {
        willSet(newValue) {
            if newValue == true {
                celsuisLabel.alpha = 1
                fahrenheitLabel.alpha = 0.6
            } else {
                celsuisLabel.alpha = 0.6
                fahrenheitLabel.alpha = 1
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
        celsuisLabel.text = "℃"
        
        slashLabel.text = " / "
        slashLabel.alpha = 0.6
        
        fahrenheitLabel.text = "℉"
        
        if isCelsius == false {
            celsuisLabel.alpha = 0.6
            fahrenheitLabel.alpha = 1
        } else {
            celsuisLabel.alpha = 1
            fahrenheitLabel.alpha = 0.6
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
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
