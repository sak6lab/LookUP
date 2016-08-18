//
//  Day.swift
//  LookUP
//
//  Created by Saketh D on 8/16/16.
//  Copyright © 2016 Saketh D. All rights reserved.
//

import Foundation

class Day {
    private var _temp: String
    private var _dayOfTheWeek: NSInteger
    private var _humidity: String
    private var _precipitation: String
    private var _weatherImgId: String
    private var _desc: String
    
    
    init(temp: String, dayOfTheWeek: NSInteger, humidity: String, precipitation: String, weatherImgId: String, desc: String){
        self._temp = temp
        self._dayOfTheWeek = dayOfTheWeek
        self._humidity = humidity
        self._precipitation = precipitation
        self._weatherImgId = weatherImgId
        self._desc = desc
        
    }
    
    
}