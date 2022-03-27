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
    var nameTimeStackView = UIStackView()
    var temperatureLabel = UILabel()
    var isCurrentImageView = UIImageView()
    
    enum Consts {
        static let nameLabelFont: UIFont = .systemFont(ofSize: 30)
        static let timeLabelFont: UIFont = .systemFont(ofSize: 16)
        static let temperatureLabelFont: UIFont = .systemFont(ofSize: 40)
        static let isCurrentImage = UIImage(systemName: "location.fill")
    }
    
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
        self.addSubview(nameTimeStackView)
        nameTimeStackView.addArrangedSubview(timeLabel)
        nameTimeStackView.addArrangedSubview(nameLabel)
        self.addSubview(temperatureLabel)
        self.addSubview(isCurrentImageView)
    }
    
    private func configurateSubviews() {
        nameLabel.font = Consts.nameLabelFont
        timeLabel.font = Consts.timeLabelFont
        temperatureLabel.font = Consts.temperatureLabelFont
        isCurrentImageView.image = Consts.isCurrentImage
    }
    
    private func setupConstraints() {
        self.heightAnchor.constraint(equalToConstant: 75).isActive = true
        
        nameTimeStackView.translatesAutoresizingMaskIntoConstraints = false
        nameTimeStackView.axis  = NSLayoutConstraint.Axis.vertical
        nameTimeStackView.distribution  = UIStackView.Distribution.equalSpacing
        nameTimeStackView.alignment = UIStackView.Alignment.leading
        nameTimeStackView.spacing = 0
        nameTimeStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        nameTimeStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
      
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        temperatureLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        isCurrentImageView.translatesAutoresizingMaskIntoConstraints = false
        isCurrentImageView.leadingAnchor.constraint(equalTo: timeLabel.trailingAnchor, constant: 5).isActive = true
        isCurrentImageView.centerYAnchor.constraint(equalTo: timeLabel.centerYAnchor).isActive = true
        isCurrentImageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        isCurrentImageView.widthAnchor.constraint(equalTo: isCurrentImageView.heightAnchor).isActive = true
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
