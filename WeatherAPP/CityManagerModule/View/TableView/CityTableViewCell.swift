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
        self.addSubview(nameTimeStackView)
        nameTimeStackView.addArrangedSubview(timeLabel)
        nameTimeStackView.addArrangedSubview(nameLabel)
        self.addSubview(temperatureLabel)
        self.addSubview(isCurrentImageView)
    }
    
    private func configureCell() {
        self.heightAnchor.constraint(equalToConstant: 75).isActive = true
    }
    
    private func configurateSubviews() {
        nameLabel.font = .systemFont(ofSize: 30)
        timeLabel.font = .systemFont(ofSize: 16)
        temperatureLabel.font = .systemFont(ofSize: 40)
        isCurrentImageView.image = UIImage(systemName: "location.fill")
    }
    
    private func setupConstraints() {
        nameTimeStackView.translatesAutoresizingMaskIntoConstraints = false
        nameTimeStackView.axis  = NSLayoutConstraint.Axis.vertical
        nameTimeStackView.distribution  = UIStackView.Distribution.equalSpacing
        nameTimeStackView.alignment = UIStackView.Alignment.leading
        nameTimeStackView.spacing = 0
        nameTimeStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        nameTimeStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//        nameLabel.translatesAutoresizingMaskIntoConstraints = false
//        nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
//        nameLabel.topAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//
//        timeLabel.translatesAutoresizingMaskIntoConstraints = false
//        timeLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
//        timeLabel.bottomAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
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
