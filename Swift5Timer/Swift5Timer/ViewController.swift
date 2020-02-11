//
//  ViewController.swift
//  Swift5Timer
//
//  Created by kamomeKUN on 2020/02/11.
// Copyright ©︎ 2020 kamomeKUN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var pauseButton: UIButton!
    
    var timer = Timer()
    
    var count = Int()
    
    var imageArray = Array<UIImage>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 初期：ストップボタンを非活性表示
        pauseButton.isEnabled = false
        //初期：画像
        imageView.image = UIImage(named: "0")
        
        count = 0
        
        // 画像を配列にセット
        for i in 0..<5 {
            let image = UIImage(named: "\(i)")
            imageArray.append(image!)
        }
    }
    
    // 0.2秒毎にtimerUpdateメソッドをコールする
    func startTimer() {
        
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    // 0.2秒毎にコールされる
    @objc func updateTimer() {
        
        count += 1
        
        // 画像数よりも増えそうな場合は0に戻す
        if count > 4 {
            count = 0
        }
        
        // 画像を配列から設定する
        imageView.image = imageArray[count]
        
    }

    // ボタンタップで画像を繰り返し表示
    @IBAction func startImage(_ sender: Any) {
        
        // startButtonとpauseButtonの活性非活性を入れ替える
        startButton.isEnabled = false
        pauseButton.isEnabled = true
        
        startTimer()
        
    }
    
    // ボタンタップでルーレットをストップ
    @IBAction func pauseImage(_ sender: Any) {
        
        // startButtonとpauseButtonの活性非活性を入れ替える
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        
        // タイマーを一時停止させる
        timer.invalidate()
        
    }
}

