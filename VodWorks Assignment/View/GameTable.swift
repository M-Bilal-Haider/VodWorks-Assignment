//
//  GameTable.swift
//  VodWorks Assignment
//
//  Created by Bilal haider on 9/26/21.
//

import UIKit

class GameTable: UIView {

    var robot : Robot? = nil {
        didSet{
            self.addSubview(robot!)
            self.setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func moveRobot()
    {
        if(robot == nil)
        {
            return
        }
        
        switch robot!.direction {
        case .Left:
            if((robot!.center.x - (robot!.frame.width / 2)) > 0)
            {
                robot!.center.x -= 10
            }
        case .Top:
            if((robot!.center.y - (robot!.frame.height / 2)) > 0)
            {
                robot!.center.y -= 10
            }
        case .Right:
            if((robot!.center.x + (robot!.frame.width / 2)) < self.frame.width)
            {
                robot!.center.x += 10
            }
        case .Down:
            if((robot!.center.y + (robot!.frame.height / 2)) < self.frame.height)
            {
                robot!.center.y += 10
            }
        
        }
        
        self.setNeedsDisplay()
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
     */
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    

}
