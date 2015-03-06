//
//  AboutViewController.swift
//  WorthCal
//
//  Created by Jiang Chuncheng on 3/6/15.
//  Copyright (c) 2015 SenseForce. All rights reserved.
//

import UIKit

class AboutViewController: BaseViewController {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var versionLabel: UILabel!
    @IBOutlet weak var copyrightLabel: UILabel!
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "关于"
        
        setNavigationBarBackButtonAutomatically()
        
        iconImageView.layer.cornerRadius = 12.0
        iconImageView.layer.masksToBounds = true
        
        versionLabel.text = String(format: "V %@", (NSBundle.mainBundle().infoDictionary?["CFBundleShortVersionString"] as String))
        
        webView.scrollView.bounces = false
        webView.loadRequest(NSURLRequest(URL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("about", ofType: "html")!)!))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
