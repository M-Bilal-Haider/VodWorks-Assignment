//
//  Robot.swift
//  VodWorks Assignment
//
//  Created by Bilal haider on 9/26/21.
//

import UIKit

class Robot: UIImageView {
    var direction : RobotDirection = .Top {
        didSet {
            self.image = UIImage(named: direction.rawValue)
        }
        
    }
    
    override init(image: UIImage?) {
        super.init(image: image)
        
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
}


enum RobotDirection: String, CaseIterable {
   case Left = "ic_robot_left"
   case Top = "ic_robot_top"
   case Right = "ic_robot_right"
   case Down = "ic_robot_down"
    
    mutating func next() {
        let allCases = type(of: self).allCases
        self = allCases[(allCases.firstIndex(of: self)! + 1) % allCases.count]
    }
    
    mutating func previous() {
        let allCases = type(of: self).allCases
        if(allCases.firstIndex(of: self)! > 0)
        {
            self = allCases[(allCases.firstIndex(of: self)! - 1)]
        }
        else
        {
            self = allCases[allCases.endIndex - 1]
        }
    }
}
