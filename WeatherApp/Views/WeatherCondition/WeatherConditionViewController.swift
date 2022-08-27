//
//  WeatherConditionViewController.swift
//  WeatherApp
//
//  Created by pc on 27.08.2022.
//

import UIKit

class WeatherConditionViewController: UIViewController {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var weatherDegreeLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var weatherForecastTableView: UITableView!
    
    
    var weatherViewModel = WeatherViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func initalizeViewModel(){
        weatherViewModel.reloadTableView = {
                DispatchQueue.main.async { self.weatherForecastTableView.reloadData() }
            }
        weatherViewModel.showError = {
                DispatchQueue.main.async { print("Something went wrong while getting the weather data..") }
            }
        weatherViewModel.showLoading = {
                DispatchQueue.main.async { self.activityIndicator.startAnimating() }
            }
        weatherViewModel.hideLoading = {
                DispatchQueue.main.async { self.activityIndicator.stopAnimating() }
            }
        weatherViewModel.getWeatherData()
        }
}

//MARK: TableView DataSource Related Methods
extension WeatherConditionViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherViewModel.numberOfCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: WeatherConditionTableViewCell.self), for: indexPath) as? WeatherConditionTableViewCell else {
            fatalError("No results found.")
        }
        let cellVM = weatherViewModel.getCellViewModel( at: indexPath )
        cell.dayLabel.text = cellVM.dayText
        cell.maxTemperatureLabel.text = cellVM.maxTemperatureText
        cell.minTemperatureLabel.text = cellVM.minTemperatureText
        return cell
    }
}
