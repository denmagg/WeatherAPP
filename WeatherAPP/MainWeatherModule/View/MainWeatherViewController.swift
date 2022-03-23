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

class MainWeatherViewController: UIViewController {
    
    var presenter: MainWeatherPresenterProtocol!
    
    var bottomPadding: CGFloat?
    let manageButton = UIButton()
    let weatherLinkButton = UIButton()
    
    lazy var cityViews = [CityView(frame: CGRect.zero, color: .blue), CityView(frame: CGRect.zero, color: .gray)]
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: self.view.frame.width * CGFloat(cityViews.count) , height: self.view.frame.height)
        
        for i in 0..<cityViews.count {
            scrollView.addSubview(cityViews[i])
            cityViews[i].frame = CGRect(x: self.view.frame.width * CGFloat(i), y: 0, width: self.view.frame.width, height: self.view.frame.height)
        }
        
        scrollView.delegate = self
        return scrollView
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = cityViews.count
        pageControl.currentPage = 0
        pageControl.addTarget(self, action: #selector(pageControlTapHaddler(sender:)), for: .touchUpInside)
        return pageControl
    }()
    
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
        manageButton.setImage(UIImage(systemName: "list.dash"), for: .normal)
        manageButton.tintColor = .init(white: 1, alpha: 0.5)
        
        weatherLinkButton.setImage(UIImage(named: "the-weather-channel"), for: .normal)
        weatherLinkButton.alpha = 0.5
    }
    
    private func setupSubviews() {
        self.view.addSubview(scrollView)
        self.view.addSubview(pageControl)
        
        self.view.addSubview(manageButton)
        self.view.addSubview(weatherLinkButton)
    }
    
    private func setupConstraints() {
        //FIXME: why translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.heightAnchor.constraint(equalToConstant: 50).isActive = true
        pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -12).isActive = true
        
        // setup manageButton constraints
        manageButton.translatesAutoresizingMaskIntoConstraints = false
        manageButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        manageButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        // setup weatherLinkButton constraints
        weatherLinkButton.translatesAutoresizingMaskIntoConstraints = false
        weatherLinkButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        weatherLinkButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        weatherLinkButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        weatherLinkButton.heightAnchor.constraint(equalTo: weatherLinkButton.widthAnchor).isActive = true
    }
    
    @objc func pageControlTapHaddler(sender: UIPageControl) {
        scrollView.scrollTo(horisontalPage: sender.currentPage , animated: true)
    }
    
}

extension MainWeatherViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = Int(round(scrollView.contentOffset.x / self.view.frame.width))
        pageControl.currentPage = pageIndex
    }
}

extension MainWeatherViewController: MainWeatherViewProtocol {
    func success() {
        print("")
    }
    
    func failure() {
        print("")
    }
}
