//
//  ManageTableViewCell.swift
//  WeatherAPP
//
//  Created by Денис Медведев on 23.03.2022.
//

import UIKit

class ManageTableViewCell: UITableViewCell {
    
    var switchTemperatureButton = UIButton()
    var addCityButton = UIButton()
    
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
        self.addSubview(switchTemperatureButton)
        self.addSubview(addCityButton)
    }
    
    private func configurateSubviews() {
        switchTemperatureButton.titleLabel?.text = "Switch"
        addCityButton.imageView?.image = UIImage(systemName: "plus.circle")
    }
    
    private func setupConstraints() {
        switchTemperatureButton.translatesAutoresizingMaskIntoConstraints = false
        switchTemperatureButton.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        switchTemperatureButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        addCityButton.translatesAutoresizingMaskIntoConstraints = false
        addCityButton.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        addCityButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
