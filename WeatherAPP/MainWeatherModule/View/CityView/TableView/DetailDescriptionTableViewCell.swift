//
//  DetailDescriptionTableViewCell.swift
//  WeatherAPP
//
//  Created by Денис Медведев on 21.03.2022.
//

import UIKit

class DetailDescriptionTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configurateSubviews()
    }
    
    private func configurateSubviews() {
        self.textLabel?.font = .systemFont(ofSize: 20)
        self.textLabel?.numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
