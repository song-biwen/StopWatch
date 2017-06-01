//
//  ViewController.swift
//  WZStopWatch
//
//  Created by songbiwen on 2017/6/1.
//  Copyright © 2017年 songbiwen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var pauseButton: UIButton!
    
    
    var Count = 0.0;
    var timer = Timer();
    var isPlaying = false;
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent;
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countLabel.text = String(Count);
    }
    
    
//   重置按钮点击事件
    @IBAction func resetButtonAction(_ sender: Any) {
        Count = 0.0;
        playButton.isEnabled = true;
        pauseButton.isEnabled = true;
        isPlaying = false;
        countLabel.text = String(Count);
        timer.invalidate();
    }

//    play按钮点击事件
    @IBAction func playButtonAction(_ sender: Any) {
        
        if (isPlaying) {
            return;
        }
        
        playButton.isEnabled = false;
        pauseButton.isEnabled = true;
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector:#selector(ViewController.updateCount) , userInfo: nil, repeats: true);
        isPlaying = true;
    }
    
//    pause按钮点击事件
    @IBAction func pauseButtonAction(_ sender: Any) {
        pauseButton.isEnabled = false;
        playButton.isEnabled = true;
        timer.invalidate();
        isPlaying = false;
    }
    
    func updateCount() {
        Count += 0.1;
        countLabel.text = String(Count);
    }
    
}

