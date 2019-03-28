//
//  ViewController.swift
//  TestAalianImage03
//
//  Created by D7703_24 on 2019. 3. 28..
//  Copyright © 2019년 D7703_24. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var alienImageView: UIImageView!
    @IBOutlet weak var countLabel: UILabel!
    var count = 1
    //timer 객체 생성
    var myTimer = Timer()
    var isAnimating = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alienImageView.image = UIImage(named: "Image\(count)")
        countLabel.text = String(count)
    }
    @IBAction func btnPray(_ sender: Any) {
        print("btnPray")
        //Timer 작동
        if isAnimating == false{
            myTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(doAnimation), userInfo: nil, repeats: true)
            isAnimating = true
        }else{
            myTimer.invalidate()
            isAnimating = false
        }
        
    }
    
    @IBAction func btnPause(_ sender: Any) {
        print("btnPause")
        myTimer.invalidate()
        
    }
    
    @IBAction func btnStop(_ sender: Any) {
        print("btnStop")
        myTimer.invalidate()
        count = 0
        
    }
    
    @objc func doAnimation() {
        if count == 5{
            count = 1
        }
        count += 1
        alienImageView.image = UIImage(named: "Image\(count)")
        countLabel.text = String(count)
        print("doAnimation 함수실행")
    }
    
}

