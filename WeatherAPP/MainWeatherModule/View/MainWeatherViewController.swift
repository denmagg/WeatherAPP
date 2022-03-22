//
//  MainWeatherViewController.swift
//  WeatherAPP
//
//  Created by Денис Медведев on 18.03.2022.
//

import UIKit

struct WeatherData {
    var dataDayForecast: [(String, String, String, String)]
    var dataDetailDescription: String
    var dataSpecs: [(String, String)]
}

struct HourlyWeatherData {
    var dataHourlyForecast: [(String, String, String)]
}

class MainWeatherViewController: UIViewController, MainWeatherViewProtocol, WeatherTableViewDelegate, WeatherCollectionViewDelegate {
    func selectedItem(number: Int) {
        print("selected item number: \(number)")
    }
    
    func selectedCell(row: Int) {
        print("Row: \(row)")
    }
    
    
    var presenter: MainWeatherPresenterProtocol!
    
    var bottomPadding: CGFloat?
    
    let cityLabel = UILabel()
    let weatherLabel = UILabel()
    let currentTemperatureLabel = UILabel()
    let todayDateLabel = UILabel()
    let todayLabel = UILabel()
    let todayMaxTemperatureLabel = UILabel()
    let todayMinTemperatureLabel = UILabel()
    
    var collectionViewDataSource: UICollectionViewDataSource?
    var collectionViewDelegate: UICollectionViewDelegate?
    var collectionView: UICollectionView?
    
    var tableViewDataSource: TableViewDataSource?
    var tableViewDelegate: TableViewDelegate?
    let tableView = UITableView()
    
    let manageButton = UIButton()
    let weatherLinkButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ios[13..15)
        //Рассчет границ safearea (if #available(iOS 13.0, *) {)
        let window = UIApplication.shared.windows.first
        bottomPadding = window?.safeAreaInsets.bottom
        
        configureView()
        configureMainWeatherInfo()
        setupSubviews()
        setupConstraints()
        
    }
    
    private func configureView() {
        self.view.backgroundColor = .systemBackground
    }
    
    private func configureMainWeatherInfo() {
        cityLabel.text = "Moscow"
        cityLabel.font = .systemFont(ofSize: 32)
//        cityLabel.font = UIFont(name: "Geeza Pro", size: 30)
        
        weatherLabel.text = "Mostly Clear"
        weatherLabel.font = .systemFont(ofSize: 17)
        
        currentTemperatureLabel.text = "5°"
        currentTemperatureLabel.font = .systemFont(ofSize: 50)
        
        todayDateLabel.text = "Friday"
        todayDateLabel.font = .systemFont(ofSize: 20)
        
        todayLabel.text = "TODAY"
        todayLabel.font = .boldSystemFont(ofSize: 16)
        
        todayMinTemperatureLabel.text = "-8"
        todayMinTemperatureLabel.font = .systemFont(ofSize: 20)
        
        todayMaxTemperatureLabel.text = "7"
        todayMaxTemperatureLabel.font = .systemFont(ofSize: 20)
        
        let layout = CollectionViewFlowLayout()
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 100), collectionViewLayout: layout)
        collectionView?.backgroundColor = .red
        let dataHourlyForecast = [("Now","☀️","8°"), ("20","☀️","8°"), ("21","☀️","8°"), ("22","☀️","8°"), ("23","☀️","8°"), ("00","☀️","8°"), ("01","☀️","8°"), ("02","☀️","8°"), ("03","☀️","8°"), ("04","☀️","8°"), ("05","☀️","8°"), ("06","☀️","8°"), ("06:28","☀️","Sunrise°"), ("07","☀️","8°"), ("08","☀️","8°"), ("09","☀️","8°"), ("10","☀️","8°"), ("11","☀️","8°"), ("12","☀️","8°"), ("13","☀️","8°"), ("14","☀️","8°"), ("15","☀️","8°"), ("16","☀️","8°"), ("17","☀️","8°"), ("18","☀️","8°"), ("18:48","☀️","Sunset°"), ("19","☀️","8°")]
        let hourlyWeatherData = HourlyWeatherData(dataHourlyForecast: dataHourlyForecast)
        self.collectionViewDelegate = CollectionViewDelegate(withDelegate: self)
        self.collectionViewDataSource = CollectionViewDataSource(withData: hourlyWeatherData)
        collectionView?.delegate = self.collectionViewDelegate
        collectionView?.dataSource = self.collectionViewDataSource
        collectionView?.register(HourlyWeatherCell.self, forCellWithReuseIdentifier: "hourlyWeatherCell")
        collectionView?.showsHorizontalScrollIndicator = false
//        collectionView.setCollectionViewLayout(UICollectionViewLayout, animated: true)
                
        //FIXME временная data
        
        let dataDayForecast = [("Saturday", "☀️", "8", "-1"), ("Sunday", "☀️", "8", "-1"), ("Monday", "☀️", "8", "-1"), ("Tuesday", "☀️", "8", "-1"), ("Wednesday", "☀️", "8", "-1"), ("Thursday", "☀️", "8", "-1"), ("Friday", "☀️", "8", "-1"), ("Saturday", "☀️", "8", "-1"), ("Sunday", "☀️", "8", "-1")]
        let dataDetailDescription = "Today: Mostly clear currently. It's 5°; the high today was forecast as 9°"
        let dataSpecs = [("SUNRISE", "6:29"), ("SUNSET", "18:45"), ("CHANCE OF RAIN", "10%"), ("HUMIDITY", "55%"), ("WIND", "NW 3 m/s"), ("FEELS LIKE", "3°"), ("PRECIPITATION", "0 cm"), ("PRESSURE", "775,71 mm Hg"), ("VISIBILITY", "9,7 km"), ("UV INDEX", "0")]
        let weatherData = WeatherData(dataDayForecast: dataDayForecast, dataDetailDescription: dataDetailDescription, dataSpecs: dataSpecs)
        
        self.tableViewDelegate = TableViewDelegate(withDelegate: self)

        self.tableViewDataSource = TableViewDataSource(withData: weatherData)
        tableView.delegate = self.tableViewDelegate
        tableView.dataSource = self.tableViewDataSource
        tableView.backgroundColor = .green
        tableView.separatorStyle = .none
        tableView.register(DayForecastTableViewCell.self, forCellReuseIdentifier: "dayForecastCell")
        tableView.register(DetailDescriptionTableViewCell.self, forCellReuseIdentifier: "detailDescriptionCell")
        tableView.register(SpecsTableViewCell.self, forCellReuseIdentifier: "specsCell")
        
        manageButton.setImage(UIImage(systemName: "list.dash"), for: .normal)
        manageButton.tintColor = .init(white: 1, alpha: 0.5)
        
        weatherLinkButton.setImage(UIImage(named: "the-weather-channel"), for: .normal)
        weatherLinkButton.alpha = 0.5
    }
    
    private func setupSubviews() {
        self.view.addSubview(cityLabel)
        self.view.addSubview(weatherLabel)
        self.view.addSubview(currentTemperatureLabel)
        
        self.view.addSubview(todayDateLabel)
        self.view.addSubview(todayLabel)
        self.view.addSubview(todayMinTemperatureLabel)
        self.view.addSubview(todayMaxTemperatureLabel)
        
        self.view.addSubview(collectionView!)
        self.view.addSubview(tableView)
        
        self.view.addSubview(manageButton)
        self.view.addSubview(weatherLinkButton)
    }
    
    private func setupConstraints() {
        //FIXME: why translatesAutoresizingMaskIntoConstraints = false
        
        //var constraints = [NSLayoutConstraint]()
        
        // setup cityLabel constraints
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        //cityLabel.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        cityLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        
        // setup weatherLabel constraints
        weatherLabel.translatesAutoresizingMaskIntoConstraints = false
        weatherLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        weatherLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor).isActive = true
        
        // setup currentTemperatureLabel constraints
        currentTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        currentTemperatureLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        currentTemperatureLabel.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor).isActive = true

        // setup todayDateLabel constraints
        todayDateLabel.translatesAutoresizingMaskIntoConstraints = false
        todayDateLabel.topAnchor.constraint(equalTo: currentTemperatureLabel.bottomAnchor, constant: 10).isActive = true
        todayDateLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        todayDateLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
        
        // setup todayLabel constraints
        todayLabel.translatesAutoresizingMaskIntoConstraints = false
        todayLabel.firstBaselineAnchor.constraint(equalTo: todayDateLabel.firstBaselineAnchor).isActive = true
        //todayLabel.topAnchor.constraint(equalTo: currentTemperatureLabel.bottomAnchor, constant: 10).isActive = true
        todayLabel.leadingAnchor.constraint(equalTo: todayDateLabel.trailingAnchor, constant: 10).isActive = true
        
        // setup todayMinTemperatureLabel constraints
        todayMinTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        todayMinTemperatureLabel.topAnchor.constraint(equalTo: currentTemperatureLabel.bottomAnchor, constant: 10).isActive = true
        todayMinTemperatureLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        // setup todayMaxTemperatureLabel constraints
        todayMaxTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        todayMaxTemperatureLabel.topAnchor.constraint(equalTo: currentTemperatureLabel.bottomAnchor, constant: 10).isActive = true
        todayMaxTemperatureLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -60).isActive = true
        
        // setup collectionView constraints
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        collectionView?.topAnchor.constraint(equalTo: todayDateLabel.bottomAnchor, constant: 5).isActive = true
        collectionView?.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        collectionView?.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        collectionView?.bottomAnchor.constraint(equalTo: tableView.topAnchor).isActive = true
        
        // setup tableView constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: todayDateLabel.bottomAnchor, constant: 100).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -(bottomPadding ?? 0)).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        // setup manageButton constraints
        manageButton.translatesAutoresizingMaskIntoConstraints = false
        manageButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 10).isActive = true
        manageButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        manageButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        // setup weatherLinkButton constraints
        weatherLinkButton.translatesAutoresizingMaskIntoConstraints = false
        weatherLinkButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 10).isActive = true
        weatherLinkButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        weatherLinkButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        weatherLinkButton.widthAnchor.constraint(equalTo: weatherLinkButton.heightAnchor).isActive = true
        
    }
    
    func success() {
        print("")
    }
    
    func failure() {
        print("")
    }
    
}
