//
//  DayForeCastCellTableViewCell.swift
//  WeatherAPP
//
//  Created by Денис Медведев on 20.03.2022.
//

import UIKit

class DayForecastTableViewCell: UITableViewCell {
    
    var dayLabel = UILabel()
    var weatherEmojiLabel = UILabel()
    var maxTemperatureLabel = UILabel()
    var minTemperatureLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupSubviews()
        configurateSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
//        self.contentView.addSubview(dayLabel)
        self.addSubview(dayLabel)
//        self.contentView.addSubview(weatherEmojiLabel)
        self.addSubview(weatherEmojiLabel)
        self.addSubview(maxTemperatureLabel)
        self.addSubview(minTemperatureLabel)
    }
    
    private func configurateSubviews() {
        dayLabel.font = .systemFont(ofSize: 20)
        weatherEmojiLabel.font = .systemFont(ofSize: 20)
        maxTemperatureLabel.font = .systemFont(ofSize: 20)
        minTemperatureLabel.font = .systemFont(ofSize: 20)
    }
    
    private func setupConstraints() {
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        dayLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        dayLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        
        weatherEmojiLabel.translatesAutoresizingMaskIntoConstraints = false
        weatherEmojiLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        weatherEmojiLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        minTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        minTemperatureLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        minTemperatureLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        
        maxTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        maxTemperatureLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        maxTemperatureLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60).isActive = true
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
