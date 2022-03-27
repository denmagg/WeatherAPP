//
//  CityManagerViewController.swift
//  WeatherAPP
//
//  Created by Денис Медведев on 23.03.2022.
//

import UIKit

class CityManagerViewController: UIViewController {
    
    var presenter: CityManagerPresenterProtocol!
    
    let tableView = UITableView()
    var citiesTableViewDataSource: CitiesTableViewDataSource?
    var citiesTableViewDelegate: CitiesTableViewDelegate?
    
    enum Consts {
        static let cityTableViewCellId = "cityCell"
        static let manageTableViewCellId = "manageCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSubviews()
        configureView()
        configureSubviews()
        setupConstraints()
    }
    
    private func configureView() {
        self.view.backgroundColor = .black
    }
    
    private func configureSubviews() {
        let dataCityList = [("Moscow", "9:45", "8°"), ("Moscow", "9:45", "8°")]
        self.citiesTableViewDataSource = CitiesTableViewDataSource(withData: dataCityList)
        self.citiesTableViewDelegate = CitiesTableViewDelegate(withDelegate: self)
        tableView.dataSource = self.citiesTableViewDataSource
        tableView.delegate = self.citiesTableViewDelegate
        tableView.backgroundColor = .green
        tableView.register(CityTableViewCell.self, forCellReuseIdentifier: "cityCell")
        tableView.register(ManageTableViewCell.self, forCellReuseIdentifier: "manageCell")
    }
    
    private func setupSubviews() {
        self.view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    @objc func didTapOnCity(sender: UIButton) {
        presenter.selectCity(city: 1)
    }
    
}

extension CityManagerViewController: CityManagerViewProtocol {
    
}

extension CityManagerViewController: CityManagerVCDelegate {
    func selectedCell(row: Int) {
        presenter.selectCity(city: row)
    }
}
