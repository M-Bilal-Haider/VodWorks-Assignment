//
//  ViewController.swift
//  VodWorks Assignment
//
//  Created by Bilal haider on 9/26/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gameTable_view: GameTable!
    
    @IBOutlet weak var status_label: UILabel!
    
    @IBOutlet weak var left_imageView: UIImageView!
    
    @IBOutlet weak var right_imageView: UIImageView!
    
    @IBOutlet weak var move_imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUI()
        setupObservors()
        
    }
    
    func setupUI()
    {
        let robot = Robot(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        robot.direction = .Top
        robot.contentMode = UIView.ContentMode.scaleAspectFit
        gameTable_view.robot = robot
    }
    
    
    func setupObservors()
    {
        left_imageView.isUserInteractionEnabled = true
        left_imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(self.movementControls_touchUpInside)))
        
        
        
        right_imageView.isUserInteractionEnabled = true
        right_imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(self.movementControls_touchUpInside)))
        
        
        
        
        move_imageView.isUserInteractionEnabled = true
        move_imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(self.movementControls_touchUpInside)))
        
        
    }
    
    
    @objc func movementControls_touchUpInside(sender : UITapGestureRecognizer) {
        
        switch sender.view {
        case left_imageView:
            gameTable_view.robot?.direction.previous()
            
        case right_imageView:
            gameTable_view.robot?.direction.next()
            
        case move_imageView:
            gameTable_view.moveRobot()
        
        default:
            print("default")
        }
    }


    @IBAction func report_touchUpInside(_ sender: Any) {
        status_label.text = "\(gameTable_view.robot!.center.x), \(gameTable_view.robot!.center.y), \(gameTable_view.robot!.direction)"
    }
}

