//
//  HourlyWeatherCell.swift
//  WeatherAPP
//
//  Created by Денис Медведев on 21.03.2022.
//

import UIKit

class HourlyWeatherCell: UICollectionViewCell {
    
    var timeLabel = UILabel()
    var weatherEmojiLabel = UILabel()
    var temperatureLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setupSubviews()
        configurateSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        self.addSubview(timeLabel)
        self.addSubview(weatherEmojiLabel)
        self.addSubview(temperatureLabel)
    }
    
    private func configurateSubviews() {
        
    }
    
    private func setupConstraints() {
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        timeLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        weatherEmojiLabel.translatesAutoresizingMaskIntoConstraints = false
        weatherEmojiLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        weatherEmojiLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        temperatureLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
