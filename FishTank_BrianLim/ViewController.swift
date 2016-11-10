//
//  ViewController.swift
//  FishTank_BrianLim
//
//  Created by Brian Lim on 10/28/16.
//  Copyright © 2016 Brian Lim. All rights reserved.
//  This app showcases multiple ways of animating objects.

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var number: UISlider!
    
    @IBOutlet var goldenFish: UIImageView!
    
    var TrueOrFalse = true
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "fishtank_background")!)
        var fishset = ["01","02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16"]
        var images = [UIImage]()
        for i in 0..<fishset.count{
            images.append(UIImage(named: fishset[i])!)//(UIImage{named:fishset[i]}!)
        }
        
        goldenFish.animationImages = images
        goldenFish.animationDuration = 5.0
        goldenFish.startAnimating()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func animate(sender: AnyObject) {
        //goldenfish
        

        
        
        // set crab
        let xStartCB = 0
        let yStartCB = NSTimeInterval(Float((random() % 80) + 640)) // randomize crab on y-axis
        let wStartCB = 50
        let hStartCB = 50
        let xEndCB = 360
        
        let redCrab1 = UIImageView()
        redCrab1.image = UIImage(named: "red_crab1")
        
        
        redCrab1.frame = CGRect(x: xStartCB, y: Int(yStartCB), width: wStartCB, height: hStartCB)
        self.view.addSubview(redCrab1)
        
        let c1Duration = NSTimeInterval(Float((random() % 5) + 1))
        let c1Delay = NSTimeInterval(Float((random() % 3) + 8)) / 10.0
        
        UIView.animateWithDuration(c1Duration, delay: c1Delay, options: [.Repeat, .Autoreverse, .CurveEaseInOut], animations: {
            redCrab1.frame = CGRect(x: xEndCB-xStartCB, y: Int(yStartCB), width: wStartCB, height:hStartCB)
            }, completion: { animationFinished in redCrab1.removeFromSuperview();}
        )
        
        // set jelly
        let xStartJelly = 0
        let yStartJelly = 600
        let wStartJelly = 100
        let hStartJelly = 100
        
        
        let jelly = UIImageView()
        jelly.image = UIImage(named: "pinkjelly")
        jelly.frame = CGRect(x: xStartJelly, y: yStartJelly, width: wStartJelly, height: hStartJelly)
        self.view.addSubview(jelly)
        
        //oscilates side to side
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: 16, y: 550))
        path.addCurveToPoint(CGPoint(x: 301, y: 550), controlPoint1: CGPoint(x: 136, y: 500), controlPoint2: CGPoint(x: 178, y: 550))
        
        // create a new CAKeyframeAnimation that animates the objects position
        let anim = CAKeyframeAnimation(keyPath: "position")
        
        // set the animations path to our bezier curve
        anim.path = path.CGPath
        
        // set some more parameters for the animation
        // this rotation mode means that our object will rotate so that it's parallel to whatever point it is currently on the curve
        anim.rotationMode = kCAAnimationRotateAuto
        anim.repeatCount = Float.infinity
        anim.duration = 5.0
        
        // we add the animation to the squares 'layer' property
        jelly.layer.addAnimation(anim, forKey: "animate position along path")

        
        // set turtle
        let numberOfTurtle = Int(self.number.value)
        
        for _ in 1...numberOfTurtle {
            
            let duration = NSTimeInterval(Int(rand()) % 3)
            let delay = 0.0
            let options = UIViewAnimationOptions.CurveLinear
            
            let size: CGFloat = CGFloat((Int(rand()) % 40)+20)
            let yPosition: CGFloat = CGFloat(Int(rand()) % 200 + 20)
            let xPosition: CGFloat = CGFloat((Int(rand()) % 320)-320)
            //let yendPosition: CGFloat = CGFloat(Int(rand()) % 200 + 320)
            //let xendPosition: CGFloat = CGFloat((Int(rand()) % 320)+320)
            // Create and add fish image
            
            let turtle = UIImageView()
            turtle.image = UIImage(named: "Turtle")
            //let turtle2 = UIImageView()
            turtle.frame = CGRectMake(xPosition, yPosition, size, size)
            self.view.addSubview(turtle)
            
            
            // Create Animation
            
            UIView.animateWithDuration(duration, delay: delay, options: options, animations: {
                
                turtle.frame = CGRectMake(320, yPosition, size, size)
                
                }, completion: { animationFinished in
                    turtle.removeFromSuperview()
            })
        }
        moveFishRight() //starts the animation of the fish
    }
  
 
    func moveFishLeft() {
        
        //set FishGoLeft
        let xStartFishFaceLeft = 320
        let yStartFishFaceLeft = 400
        let wFishFaceLeft = 100
        let hFishFaceLeft = 100
        let xEndFishFaceLeft = 370
        
        let fish = UIImageView()
        fish.image = UIImage(named: "FishGoLeft")
        fish.frame = CGRect(x: xStartFishFaceLeft, y: yStartFishFaceLeft, width: wFishFaceLeft, height: hFishFaceLeft)
        self.view.addSubview(fish)
        
        let fflDuration = NSTimeInterval(Float((random() % 5) + 1))
        let fflDelay = NSTimeInterval(Float((random() % 3) + 8)) / 10.0
        
        UIView.animateWithDuration(fflDuration, delay: fflDelay, options: .CurveEaseInOut, animations: {
            fish.frame = CGRect(x: xEndFishFaceLeft-xStartFishFaceLeft, y: yStartFishFaceLeft, width: wFishFaceLeft, height:hFishFaceLeft)
            }, completion: { animationFinished in fish.removeFromSuperview(); self.moveFishRight()}
        )

    }


    
    func moveFishRight() {
        
        //set FishGoLeft
        let xStartFishFaceRight = 0
        let yStartFishFaceRight = 400
        let wFishFaceRight = 100
        let hFishFaceRight = 100
        let xEndFishFaceRight = 320
        
        let fish = UIImageView()
        fish.image = UIImage(named: "FishGoRight")
        fish.frame = CGRect(x: xStartFishFaceRight, y: yStartFishFaceRight, width: wFishFaceRight, height: hFishFaceRight)
        self.view.addSubview(fish)
        
        let fflDuration = NSTimeInterval(Float((random() % 5) + 1))
        let fflDelay = NSTimeInterval(Float((random() % 3) + 8)) / 10.0
        
        UIView.animateWithDuration(fflDuration, delay: fflDelay, options: .CurveEaseInOut, animations: {
            fish.frame = CGRect(x: xEndFishFaceRight-xStartFishFaceRight, y: yStartFishFaceRight, width: wFishFaceRight, height:hFishFaceRight)
            }, completion: { animationFinished in fish.removeFromSuperview(); self.moveFishLeft()}
        )
    }
    
}// end class

