//
//  WorthViewController.swift
//  WorthCal
//
//  Created by Jiang Chuncheng on 2/20/15.
//  Copyright (c) 2015 SenseForce. All rights reserved.
//

import UIKit

class WorthViewController: BaseViewController {
    
    @IBOutlet weak var calculateButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "身价计算器"
        
        let buttonImage = UIImage.imageWithColor(UIColor(red:73/255.0, green:200/255.0, blue:85/255.0, alpha:1), forSize: calculateButton.frame.size)
        calculateButton.setTitleColor(UIColor.whiteColor(), forState:.Normal)
        calculateButton.setBackgroundImage(buttonImage, forState: .Normal)
        calculateButton.layer.cornerRadius = 4.0
        calculateButton.layer.masksToBounds = true
        calculateButton.addTarget(self, action: "calculateButtonClicked:", forControlEvents: .TouchUpInside)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calculateButtonClicked(sender: UIButton) {
        view.endEditing(false)
    }

}
