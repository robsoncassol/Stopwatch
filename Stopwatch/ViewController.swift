//
//  ViewController.swift
//  Stopwatch
//
//  Created by Robson Cassol on 14/05/15.
//  Copyright (c) 2015 cassol. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playButton: UIBarButtonItem!
    @IBOutlet weak var timerLabel: UILabel!


    var timer = NSTimer()
    var counter = 0
    var minutes = 0
    
    @IBAction func start(sender: AnyObject) {
        if !timer.valid {
            playButton.title = "\u{2016}"
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateTime"), userInfo: nil, repeats: true)
        }else {
            playButton.title = "\u{25B6}"
            timer.invalidate()
        }
    }
    
    @IBAction func pause(sender: AnyObject) {

        timer.invalidate()
        
    }
    
    @IBAction func refresh(sender: AnyObject) {
        
       reset()
        
    }
    
    @IBAction func stop(sender: AnyObject) {
        
        timer.invalidate()
        
        reset()
        
    }
    
    func updateTime() {
        
        counter++
        setTimer()
        
    }
    
    func reset() {
        
        counter = 0
        minutes = 0
        setTimer()
        
    }
    
    func setTimer(){
        
        if counter == 60 {
            counter = 0
            minutes++
        }
        timerLabel.text =  String(format: "%02d:%02d",minutes,counter)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

