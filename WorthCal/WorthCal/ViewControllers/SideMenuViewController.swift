//
//  SideMenuViewController.swift
//  WorthCal
//
//  Created by Jiang Chuncheng on 3/6/15.
//  Copyright (c) 2015 SenseForce. All rights reserved.
//

import UIKit

class SideMenuViewController: BaseViewController, RETableViewManagerDelegate {
    
    var tableView: UITableView?
    var tableViewManager: RETableViewManager?
    
    let kMenuItemHeight: CGFloat = 60.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Plain)
        self.tableView?.backgroundColor = UIColor.clearColor()
        self.tableView?.separatorColor = UIColor(white: 0.8, alpha: 1.0)
        self.tableView?.separatorInset = UIEdgeInsetsMake(0, 2, 0, 5);
        self.tableView?.tableFooterView = UIView(frame: CGRectZero)
        self.view.addSubview(self.tableView!);
        
        self.tableViewManager = RETableViewManager(tableView: self.tableView, delegate: self)
        self.tableViewManager?.addSection(addTableViewItems())
        
        layoutTableView(self.view.bounds.size)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
    添加菜单项列表
    
    :returns: 菜单项Section
    */
    func addTableViewItems() -> RETableViewSection{
        let section = RETableViewSection()
        
        var item: RETableViewItem?
        
        //意见反馈
        item = RETableViewItem(title: "我要提意见", accessoryType: UITableViewCellAccessoryType.None, selectionHandler: { (item) -> Void in
            item.deselectRowAnimated(true)
            self.sideMenuViewController.hideMenuViewController()

            let contentViewController = self.sideMenuViewController.contentViewController
            contentViewController.presentViewController(UMFeedback.feedbackModalViewController(), animated: true, completion: nil)
            
            return
        })
        item?.cellHeight = kMenuItemHeight
        section.addItem(item)
        
        //给个好评
        item = RETableViewItem(title: "给个好评", accessoryType: UITableViewCellAccessoryType.None, selectionHandler: { (item) -> Void in
            item.deselectRowAnimated(true)
            self.sideMenuViewController.hideMenuViewController()
            
            Appirater.rateApp()
            
            return
        })
        item?.cellHeight = kMenuItemHeight
        section.addItem(item)
        
        //怎么提高身价
        item = RETableViewItem(title: "怎么提高身价", accessoryType: UITableViewCellAccessoryType.None, selectionHandler: { (item) -> Void in
            item.deselectRowAnimated(true)
            self.sideMenuViewController.hideMenuViewController()
            
            return
        })
        item?.cellHeight = kMenuItemHeight
        section.addItem(item)
        
        //关于身价计算器
        item = RETableViewItem(title: "关于身价计算器", accessoryType: UITableViewCellAccessoryType.None, selectionHandler: { (item) -> Void in
            item.deselectRowAnimated(true)
            self.sideMenuViewController.hideMenuViewController()
            
            return
        })
        item?.cellHeight = kMenuItemHeight
        section.addItem(item)
        
        return section;
    }
    
    /**
    更新菜单项位置
    
    :param: size 视图的大小，如self.view.bounds.size
    */
    func layoutTableView(size: CGSize) {
        var frame = CGRectZero;
        frame.size.width = 0.64 * size.width
        let items: AnyObject? = tableViewManager?.sections.first?.items
        frame.size.height = kMenuItemHeight * CGFloat((items as NSArray).count)
        frame.origin.y = 0.5 * (size.height - CGRectGetHeight(frame))
        self.tableView?.frame = frame;
    }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        super.didRotateFromInterfaceOrientation(fromInterfaceOrientation)
        layoutTableView(self.view.bounds.size)
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        layoutTableView(size)
    }
}
