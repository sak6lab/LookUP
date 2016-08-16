//
//  Day.swift
//  LookUP
//
//  Created by Saketh D on 8/16/16.
//  Copyright © 2016 Saketh D. All rights reserved.
//

import Foundation

class Day {
    private var _weatherImgId: String!
    private var _dt: String!
    private var _desc: String!
    private var _dayOfTheWeek: String!
    
    var weatherImgId: String{
        return _weatherImgId
    }
    
    var desc: String{
        return _desc
    }
    
    var dayOfTheWeek: String{
        return _dayOfTheWeek
    }
    
}