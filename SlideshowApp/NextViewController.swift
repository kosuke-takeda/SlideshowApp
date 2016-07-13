//
//  NextViewController.swift
//  SlideshowApp
//
//  Created by kohsuke.takeda on 2016/07/06.
//  Copyright © 2016年 kosuke.takeda. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var bigImageView: UIImageView!
    var image : UIImage!
    
    @IBAction func pushBackBtn(sender: AnyObject) {
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        bigImageView.image = image
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
