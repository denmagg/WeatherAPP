//
//  SpecsTableViewCell.swift
//  WeatherAPP
//
//  Created by Денис Медведев on 21.03.2022.
//

import UIKit

class SpecsTableViewCell: UITableViewCell {
    
//    static let reuseIdentifier = "specsCell"
//    static func nib() -> UINib {
//        return UINib(nibName: "specsCell", bundle: nil)
//    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: "specsCell")
        
        configurateSubviews()
    }
    
    private func configurateSubviews() {
        self.textLabel?.font = .systemFont(ofSize: 10)
        self.detailTextLabel?.font = .systemFont(ofSize: 25)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
