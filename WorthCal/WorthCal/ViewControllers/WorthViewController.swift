//
//  WorthViewController.swift
//  WorthCal
//
//  Created by Jiang Chuncheng on 2/20/15.
//  Copyright (c) 2015 SenseForce. All rights reserved.
//

import UIKit

class WorthViewController: BaseViewController {

    @IBOutlet weak var salaryTextField: UITextField!
    @IBOutlet weak var onTimeTextField: UITextField!
    @IBOutlet weak var offTimeTextField: UITextField!
    @IBOutlet weak var overtimeTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    var dateFormatter: NSDateFormatter!
    var onDate: NSDate!
    var offDate: NSDate!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "身价计算器"
        
        dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "zh_CN")
        dateFormatter.dateFormat = "a h:mm"
        
        onDate = dateFormatter.dateFromString("上午 9:00")
        offDate = dateFormatter.dateFromString("下午 5:00")
        
        var datePicker = UIDatePicker(frame: CGRectZero)
        datePicker.locale = NSLocale(localeIdentifier: "zh_CN")
        datePicker.date = onDate;
        datePicker.datePickerMode = UIDatePickerMode.Time
        datePicker.minuteInterval = 15
        datePicker.backgroundColor = UIColor.whiteColor()
        datePicker.addTarget(self, action: "onTimeUpdated:", forControlEvents: UIControlEvents.ValueChanged)
        onTimeTextField.inputView = datePicker;
//        onTimeTextField.tintColor = UIColor.clearColor();
        
        datePicker = UIDatePicker(frame: CGRectZero)
        datePicker.locale = NSLocale(localeIdentifier: "zh_CN")
        datePicker.date = offDate;
        datePicker.datePickerMode = UIDatePickerMode.Time
        datePicker.minuteInterval = 15
        datePicker.backgroundColor = UIColor.whiteColor()
        datePicker.addTarget(self, action: "offTimeUpdated:", forControlEvents: UIControlEvents.ValueChanged)
        offTimeTextField.inputView = datePicker;
//        offTimeTextField.tintColor = UIColor.clearColor();
        
        var buttonImage = UIImage.imageWithColor(UIColor(red:73/255.0, green:200/255.0, blue:85/255.0, alpha:1), forSize: calculateButton.frame.size)
        calculateButton.setTitleColor(UIColor.whiteColor(), forState:.Normal)
        calculateButton.setBackgroundImage(buttonImage, forState: .Normal)
        calculateButton.layer.cornerRadius = 4.0
        calculateButton.layer.masksToBounds = true
        calculateButton.addTarget(self, action: "calculateButtonClicked:", forControlEvents: .TouchUpInside)
        
        syncTextField(onTimeTextField, withDate: onDate);
        syncTextField(offTimeTextField, withDate: offDate);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calculateButtonClicked(sender: UIButton) {
        view.endEditing(false)
    }
    
    func onTimeUpdated(sender: UIDatePicker) {
        onDate = sender.date;
        syncTextField(onTimeTextField, withDate: onDate);
    }
    
    func offTimeUpdated(sender: UIDatePicker) {
        offDate = sender.date;
        syncTextField(offTimeTextField, withDate: offDate);
    }
    
    func syncTextField(textField: UITextField, withDate date: NSDate) {
        textField.text = dateFormatter.stringFromDate(date);
    }

}
