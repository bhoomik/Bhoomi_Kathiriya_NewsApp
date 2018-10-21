//
//  NewsListViewModel.swift
//  NewsApp
//
//  Created by Bhoomi Kathiriya on 20/10/18.
//  Copyright © 2018 Bhoomi Kathiriya. All rights reserved.
//

import UIKit

class NewsListViewModel: NSObject {

    
    @objc dynamic private(set) var newsViewModels :[NewsViewModel] = [NewsViewModel]()
    private var newsService : NewsService
    var newsView : NewsView?
    func attachView(view: NewsView) {
        newsView = view
    }
    
    func detachView() {
        newsView = nil
    }
    init(newsservice :NewsService) {
        
        self.newsService = newsservice
        super.init()
        
        
        // call populate sources
        populateSources()
        
    
    }
    
    func populateSources() {
      
        if(Helper.sharedInstance.checkIntenetConnection() == true)
        {
            
        
            print("newsview is",self.newsView)
            self.newsView?.startLoading!()
            
            
            let strURL = String(format: "%@%@",kBaseURL,kAPIKey)
            
            
            
            
            
            print("get weather method url",strURL)
            
            
            
            
            self.newsService.createRequest(qMes: "",  strURL: strURL, method: "GET", completionBlock: { (output)   in
                // your failure handle
                
                print("get weather output is",output)
                
                 let dictResponse = output
                
                var dictTemp : NSDictionary  = NSDictionary()
                
                dictTemp = output as NSDictionary
                let dictionaries = dictTemp["results"] as! [JSONDictionary]
                
                let arrNews = dictionaries.compactMap(News.init)
                
                print("arrNews is",arrNews)
                
                self.newsViewModels = arrNews.compactMap(NewsViewModel.init)

                self.newsView?.setNewsData(news: self.newsViewModels)
                print("news view model is",self.newsViewModels)
                
                
             /*   var strTemp : String = ""
                var strRain : String = ""
                var strHumidity : String = ""
                var strWind : String = ""
                var strCity : String = ""
                var strCountry : String = ""
                
                
                
                if let city = dictTemp.value(forKey: "name") as? String
                {
                    strCity = city
                    print("city is",strCity)
                }
                
                var  dictMain : NSDictionary  = NSDictionary()
                
                if let maindict = dictTemp.value(forKey: "main") as? NSDictionary
                    
                {
                    dictMain = maindict
                    
                    if let humidity = dictMain.value(forKey: "humidity") as? NSNumber
                    {
                        strHumidity = String(format: "%@ %%",humidity)
                        print("humidity is",strHumidity)
                    }
                    if let temp = dictMain.value(forKey: "temp") as? NSNumber
                    {
                        
                        print("temp1 is",temp)
                        if(strUnit == "Metric")
                        {
                            strTemp = String(format: "%@ C",temp)
                        }
                        else
                        {
                            strTemp = String(format: "%@ F",temp)
                            
                        }
                        
                        print("temp is",strTemp)
                    }
                    
                    
                    print("main dict is",dictMain)
                }
                
                if let sysict = dictTemp.value(forKey: "sys") as? NSDictionary
                    
                {
                    //  dictMain = maindict
                    
                    if let country = sysict.value(forKey: "country") as? String
                    {
                        strCountry = String(format: "%@",country)
                        print("country is",strCountry)
                    }
                    
                }
                
                var  dictWind : NSDictionary  = NSDictionary()
                
                if let winddict = dictTemp.value(forKey: "wind") as? NSDictionary
                    
                {
                    dictWind = winddict
                    var strSpeed : String = ""
                    var strDegree : String = ""
                    if let speed = dictWind.value(forKey: "speed") as? NSNumber
                    {
                        strSpeed = String(format: "%@",speed)
                        print("humidity is",strHumidity)
                    }
                    if let degree = dictWind.value(forKey: "deg") as? NSNumber
                    {
                        strDegree = String(format: "%@",degree)
                        print("temp is",strTemp)
                    }
                    
                    if(strUnit == "Metric")
                    {
                        strWind = String(format: "%@ at %@ km/h",strDegree,strSpeed)
                    }
                    else
                    {
                        strWind = String(format: "%@ at %@ mph",strDegree,strSpeed)
                        
                    }
                    print("wind info",strWind)
                }
                
                var  dictRain : NSDictionary  = NSDictionary()
                var arrWeather : NSArray = NSArray()
                
                if let weather = dictTemp.value(forKey: "weather") as? NSArray
                    
                {
                    
                    arrWeather = weather
                    
                    print("arrweather is",arrWeather)
                    
                    if let rainDict = arrWeather.object(at: 0) as? NSDictionary
                    {
                        dictRain =  rainDict
                        
                        if let rain = dictRain.value(forKey: "main") as? String
                        {
                            strRain = String(format: "%@",rain)
                            print("temp is",strRain)
                        }
                        
                    }
                }
                var dictWeather : NSMutableDictionary = NSMutableDictionary()
                dictWeather  = dictTemp.mutableCopy() as! NSMutableDictionary
                
                let objWeatherInfo : WeatherInfo = WeatherInfo(strCity: strCity, strCountry: strCountry, dictWeather: dictWeather, strTemp: strTemp, strHumidiy: strHumidity, strRain: strRain, strWind: strWind, strDay: "", strTempMax: "", strTempMin: "")
                
                
                print("dict weather output",dictTemp)
                
                
                
                
                self.locationView?.setWeatherInfo!(objWeatherInfo: objWeatherInfo)
                
                
                //print("arrtemp count",arrTemp?.count)*/
                
                
                
                
                DispatchQueue.main.async { () -> Void in
                    
                    self.newsView?.finishLoading!()
                }
                
            }, andFailureBlock:   { (failure) -> Void in
                  DispatchQueue.main.async { () -> Void in
                    self.newsView?.finishLoading!()
                    
                }
            })
            
            
        }
        else
        {
            
            //  self.displayNoInternetAlert()
            //return
            
        }
    }

}


class NewsViewModel : NSObject {
    
   // var id :String?
    var name :String?
    var strDescription :String?
    var strBy : String?
    var strPublishedDate : String?
    var strURL : String?
   // var strAuthor : String?
    var strNewsURL : String?

    init(name :String, description: String,by : String,publisheddate:String,URL : String,newsURL : String) {
        self.name = name
        self.strDescription = description
        self.strBy = by
        self.strPublishedDate = publisheddate
        self.strURL = URL
        self.strNewsURL = newsURL
    }
    
    init(news : News) {
        
        self.name = news.strTitle
        self.strDescription = news.strDescription
        self.strBy = news.strBy
        self.strPublishedDate = news.strPubhisedDate
        self.strURL = news.strURL
        self.strNewsURL = news.strNewsURL
    }
}
