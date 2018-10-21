//
//  LocationView.swift
//  WeatherApp
//
//  Created by Bhoomi Kathiriya on 14/10/18.
//  Copyright © 2018 Bhoomi Kathiriya. All rights reserved.
//
import Foundation
import UIKit
@objc protocol NewsView: NSObjectProtocol {
	
    @objc optional func startLoading()
	@objc optional func finishLoading()

	
   // @objc optional func setWeatherInfo(objWeatherInfo : WeatherInfo)

    //@objc optional func setWeeklyForecastData(arrWeatherInfo: [WeatherInfo])
    
     func setNewsData(news: [NewsViewModel])


   
}
