//
//  ViewController.swift
//  Swift音乐播放
//
//  Created by HAO on 16/7/7.
//  Copyright © 2016年 Beacool. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    var player = AVAudioPlayer()
    
    let gradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.sharedApplication().statusBarHidden =  true
    }


    @IBAction func play(sender: AnyObject) {
        
        let musicUrl = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("little_lucky", ofType: "mp3")!)
        do{
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            try player = AVAudioPlayer(contentsOfURL: musicUrl)
            
            player.prepareToPlay()
            player.play()
        }
        catch let avdioError as NSError{
            print(avdioError)
        }
        
        NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(randomColor), userInfo: nil, repeats: true)
        
        randomColor()
        
        
        gradientLayer.frame = view.bounds
        let color1 = UIColor(white: 0.5, alpha: 0.2).CGColor as CGColorRef
        let color2 = UIColor(red: 1.0, green: 0, blue: 0, alpha: 0.4).CGColor as CGColorRef
        let color3 = UIColor(red: 0, green: 1, blue: 0, alpha: 0.3).CGColor as CGColorRef
        let color4 = UIColor(red: 0, green: 0, blue: 1, alpha: 0.3).CGColor as CGColorRef
        let color5 = UIColor(white: 0.4, alpha: 0.2).CGColor as CGColorRef
        
        gradientLayer.colors = [color1, color2, color3, color4, color5]
        gradientLayer.locations = [0.10, 0.30, 0.50, 0.70, 0.90]
        gradientLayer.startPoint = CGPointMake(0, 0)
        gradientLayer.endPoint = CGPointMake(1, 1)
        self.view.layer.addSublayer(gradientLayer)
        
    }
    
    func randomColor() -> Void {
        let r = CGFloat(drand48())
        let g = CGFloat(drand48())
        let b = CGFloat(drand48())
        self.view.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

