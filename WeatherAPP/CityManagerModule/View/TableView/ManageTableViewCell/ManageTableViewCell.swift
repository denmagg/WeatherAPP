//
//  ManageTableViewCell.swift
//  WeatherAPP
//
//  Created by Денис Медведев on 23.03.2022.
//

import UIKit

class ManageTableViewCell: UITableViewCell {
    
    var switchTemperatureButton = SwitchTemperatureButton(isCelsius: true)
    var addCityButton = UIButton()
    let weatherLinkButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupSubviews()
        configureCell()
        configurateSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        self.addSubview(switchTemperatureButton)
        self.addSubview(addCityButton)
        self.addSubview(weatherLinkButton)
    }
    
    private func configureCell() {
        self.heightAnchor.constraint(equalToConstant: 75).isActive = true
    }
    
    private func configurateSubviews() {
        switchTemperatureButton.backgroundColor = .purple
        switchTemperatureButton.tintColor = .white
        
        addCityButton.backgroundColor = .purple
        addCityButton.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        addCityButton.tintColor = .white
        
        weatherLinkButton.setImage(UIImage(named: "the-weather-channel"), for: .normal)
        weatherLinkButton.alpha = 0.6
    }
    
    private func setupConstraints() {
        switchTemperatureButton.translatesAutoresizingMaskIntoConstraints = false
        switchTemperatureButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        switchTemperatureButton.centerYAnchor.constraint(equalTo: addCityButton.centerYAnchor).isActive = true
        switchTemperatureButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 70).isActive = true
        
        addCityButton.translatesAutoresizingMaskIntoConstraints = false
        addCityButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        addCityButton.bottomAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        addCityButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        addCityButton.widthAnchor.constraint(equalTo: addCityButton.heightAnchor).isActive = true
        
        weatherLinkButton.translatesAutoresizingMaskIntoConstraints = false
        weatherLinkButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        weatherLinkButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        weatherLinkButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        weatherLinkButton.widthAnchor.constraint(equalTo: weatherLinkButton.heightAnchor).isActive = true
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}