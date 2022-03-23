//
//  CityTableViewCell.swift
//  WeatherAPP
//
//  Created by Денис Медведев on 23.03.2022.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    var nameLabel = UILabel()
    var timeLabel = UILabel()
    var temperatureLabel = UILabel()
    var isCurrentImageView = UIImageView()
    
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
        self.addSubview(nameLabel)
        self.addSubview(timeLabel)
        self.addSubview(temperatureLabel)
        self.addSubview(isCurrentImageView)
    }
    
    private func configurateSubviews() {
        nameLabel.font = .systemFont(ofSize: 30)
        timeLabel.font = .systemFont(ofSize: 12)
        temperatureLabel.font = .systemFont(ofSize: 40)
        isCurrentImageView.image = UIImage(systemName: "location.fill")
    }
    
    private func setupConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        timeLabel.bottomAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        temperatureLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        isCurrentImageView.translatesAutoresizingMaskIntoConstraints = false
        isCurrentImageView.leadingAnchor.constraint(equalTo: timeLabel.trailingAnchor, constant: 5).isActive = true
        isCurrentImageView.centerYAnchor.constraint(equalTo: timeLabel.centerYAnchor).isActive = true
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
