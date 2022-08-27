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
    
    @IBOutlet weak var WeatherForecastTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
