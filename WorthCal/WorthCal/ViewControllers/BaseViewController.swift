//
//  BaseViewController.swift
//  WorthCal
//
//  Created by Jiang Chuncheng on 2/20/15.
//  Copyright (c) 2015 SenseForce. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        MobClick.beginLogPageView(NSStringFromClass(self.dynamicType).componentsSeparatedByString(".").last! as String)
    }
    
    override func viewDidDisappear(animated: Bool) {
        MobClick.endLogPageView(NSStringFromClass(self.dynamicType).componentsSeparatedByString(".").last! as String)
        super.viewDidDisappear(animated)
    }

}
