//
//  Week.swift
//  LookUP
//
//  Created by Saketh D on 8/16/16.
//  Copyright © 2016 Saketh D. All rights reserved.
//

import Alamofire
import MapKit

class Week {
    
    var lat: String
    var lon: String
    var location: String!
    
    var days: [Day]!

    init(lat: String, lon: String){
        self.lat = lat
        self.lon = lon
    }
    func downloadWeekDetails(complete: downloadComplete){
        let urlstr = "\(urlBase)\(urlForcast)lat=\(lat)&lon=\(lon)&units=imperial&appid=\(API_KEY)"
        let url = NSURL(string: urlstr)!
        Alamofire.request(.GET,url).responseJSON {(response:Response<AnyObject, NSError>) in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let citydict = dict["city"] as? Dictionary<String, AnyObject> {
                    if let name = citydict["name"] as? String, let country = citydict["country"] as? String {
                        self.location = "\(name)/\(country)"
                    }
                }
                
                if let list = dict["list"] as? [Dictionary<String,AnyObject>] {
                    
                    var _temp: String!
                    var _dayOfTheWeek: NSInteger!
                    var _humidity: String!
                    var _precipitation: String!
                    var _weatherImgId: String!
                    var _desc: String!
                    
                    for interval in list {
                        if let dt = interval["dt_txt"] as? String{
                            let dateFormatter = NSDateFormatter()
                            dateFormatter.dateFormat = "yyyy-MM-dd"
                            if let date = dateFormatter.dateFromString(dt){
                                let myCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
                                let myComponents = myCalendar.components(.Weekday, fromDate: date )
                                _dayOfTheWeek = myComponents.weekday
                            }
                        }
                        
                        if let main = interval["main"] as? Dictionary<String,AnyObject>{
                            if let temp = main["temp"] as? String {
                                _temp = temp
                            }
                            
                            if let humidity = main["humidity"] as? String {
                                _humidity = humidity
                            }
                        }
                        
                        if let weather = interval["weather"] as? Dictionary<String,AnyObject>{
                            if let desc = weather["escription"] as? String {
                                _desc = desc
                            }
                            
                            if let weatherImgId = interval["icon"] as? String {
                                _weatherImgId = weatherImgId
                            }
                        }
                        if let rain = interval["rain"] as? Dictionary<String,AnyObject>{
                            if let precip = rain["3h"] as? String {
                                _precipitation = precip
                            }
                        }
                        
                        print(_temp)
                        print(_dayOfTheWeek)
                        print(_humidity)
                        print(_precipitation)
                        print(_weatherImgId)
                        print(_desc)
                        complete()
                        
                        //let day = Day(temp: _temp, dayOfTheWeek: _dayOfTheWeek , humidity: _humidity, precipitation: _precipitation, weatherImgId: _weatherImgId, desc: _desc)
                        
                        //self.days.append(day)
                    }
                    
                }
            }
            
        }
    }
    
}