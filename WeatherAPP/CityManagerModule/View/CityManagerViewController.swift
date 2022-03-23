//
//  CityManagerViewController.swift
//  WeatherAPP
//
//  Created by Денис Медведев on 23.03.2022.
//

import UIKit

class CityManagerViewController: UIViewController {
    
    var tableViewDataSource: CitiesTableViewDataSource?
    var tableViewDelegate: CitiesTableViewDelegate?
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        configureSubviews()
        setupSubviews()
        setupConstraints()
    }
    
    private func configureView() {
        self.view.backgroundColor = .black
    }
    
    private func configureSubviews() {
        
    }
    
    private func setupSubviews() {
        self.view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
}

extension CityManagerViewController: CityManagerVCDelegate {
    func selectedCell(row: Int) {
        print("Row \(row)")
    }
}
