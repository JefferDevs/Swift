//
//  ViewController.swift
//  Swift秒表
//
//  Created by HAO on 16/7/6.
//  Copyright © 2016年 Beacool. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var stopBtn: UIButton!
    
    var timer = NSTimer()
    var counter = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = String(counter)
    }

    @IBAction func start(sender: AnyObject) {
        startBtn.enabled = false
        stopBtn.enabled = true
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
   
    @IBAction func stop(sender: AnyObject) {
        startBtn.enabled = true
        stopBtn.enabled = false
        timer.invalidate()
    }
    
    @IBAction func reset(sender: AnyObject) {
        timer.invalidate()
        startBtn.enabled = true
        stopBtn.enabled = true
        counter = 0.0
        timeLabel.text = String(counter);
    }
    
    func updateTime() -> Void {
        counter+=0.1
        timeLabel.text = String(format: "%0.1f",counter)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

