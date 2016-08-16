//
//  DayCell.swift
//  LookUP
//
//  Created by Saketh D on 8/16/16.
//  Copyright © 2016 Saketh D. All rights reserved.
//

import UIKit

class DayCell: UITableViewCell {
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherImg: UIImageView!
    @IBOutlet weak var dayDesc: UILabel!
    
    var day: Day!

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 2.0
        layer.shadowColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.5).CGColor
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 0.8
        
    }
    
    func configureCell(day: Day){
        self.day = day
    }
}
