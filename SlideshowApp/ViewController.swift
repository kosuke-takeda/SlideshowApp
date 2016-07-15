//
//  ViewController.swift
//  SlideshowApp
//
//  Created by kohsuke.takeda on 2016/07/06.
//  Copyright © 2016年 kosuke.takeda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //配列で画像を管理[0,1,2]
    let imageNames : [String] = [
        "image01.jpg",
        "image02.jpg",
        "image03.jpg"
    ]
    var imageIndex : Int = 0
    
    var timer : NSTimer? = nil
    
    //imageViewの記述
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var prevBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var ssBtn: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let image : UIImage! = UIImage(named: "image01.jpg")
        imageView.image = image;
        
    }
    
    //PrevBtn
    @IBAction func pushPrevBtn(sender: AnyObject) {
        imageIndex -= 1
        if imageIndex <= -1 {
            imageIndex = 2
        }
        let image : UIImage! = UIImage(named: imageNames[imageIndex])
        imageView.image = image;
    }
    
    //Next Btn
    @IBAction func pushNextBtn(sender: AnyObject) {
        imageIndex += 1
        if imageIndex >= imageNames.count {
            imageIndex = 0
        }
        
        let image : UIImage! = UIImage(named: imageNames[imageIndex])
        imageView.image = image;
    }
    
    //スライドショウBtn　一定時間ごとにNextBtnを押すようにする
    @IBAction func pushStratBtn(sender: AnyObject) {
        if timer == nil{
            timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.pushNextBtn(_:)), userInfo: nil, repeats: true)
            
            //ボタン無効
            prevBtn.enabled = false;
            nextBtn.enabled = false;
            //stratをstopに変える記述
            ssBtn.setTitle("Stop", forState: .Normal)
            
        }else{
            timer?.invalidate()
            timer = nil
            //ボタン有効
            prevBtn.enabled = true;
            nextBtn.enabled = true;
            //stopをstartに戻す
            ssBtn.setTitle("Start", forState: .Normal)
            
        }
        
    }
    // segue設定
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        let nextVC = segue.destinationViewController as! NextViewController
        nextVC.image = imageView.image
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        }

     override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}