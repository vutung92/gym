//
//  ViewController.swift
//  gym
//
//  Created by Tung Vu on 8/2/18.
//  Copyright © 2018 Tung Vu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var viewWeek: UIView!
    @IBOutlet weak var viewBodyMetrics: UIView!
    @IBOutlet weak var viewNutrition: UIView!
    
    let shapeLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupViewShadow(view: viewWeek)
        setupViewShadow(view: viewBodyMetrics)
        setupViewShadow(view: viewNutrition)
        createProgressBar()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupViewShadow(view:UIView) {
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 5
        view.layer.cornerRadius = 17
    }
    
    func degreesToRadians (number: Int) -> CGFloat {
        return CGFloat((number/100)*360) * CGFloat.pi / 180.0
    }
    
    func createProgressBar(){
        
        let center = viewNutrition.center
        
        let trackLayer = CAShapeLayer()
        //let segmentAngle: CGFloat = (360 * 0.127) / 360
        let cỉcularPath = UIBezierPath(arcCenter: center , radius: 50, startAngle: -CGFloat.pi/2, endAngle: degreesToRadians(number:50), clockwise: true)
        let trackerPath = UIBezierPath(arcCenter: center , radius: 50, startAngle: -CGFloat.pi/2, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        trackLayer.path = trackerPath.cgPath
        
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 5
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = kCALineCapRound
        view.layer.addSublayer(trackLayer)
        
        //let cỉcularPath = UIBezierPath(arcCenter: center , radius: 80, startAngle: -CGFloat.pi/2, endAngle: 2 * CGFloat.pi, clockwise: true)
        shapeLayer.path = cỉcularPath.cgPath
        
        shapeLayer.strokeColor = UIColor.green.cgColor
        shapeLayer.lineWidth = 5
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = kCALineCapRound
        
        shapeLayer.strokeEnd = 0
        view.layer.addSublayer(shapeLayer)
        
        let basicAnim = CABasicAnimation(keyPath: "strokeEnd")
        basicAnim.toValue = 1
        basicAnim.duration = 2
        basicAnim.fillMode = kCAFillModeForwards
        basicAnim.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnim, forKey: "basic")
        
        
    }
    

}

