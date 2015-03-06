//
//  AppDelegate.swift
//  WorthCal
//
//  Created by Jiang Chuncheng on 2/20/15.
//  Copyright (c) 2015 SenseForce. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, RESideMenuDelegate {

    var window: UIWindow?
    weak var contentNavigationController: UINavigationController?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.    
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.backgroundColor = UIColor.blueColor()
        self.window?.makeKeyAndVisible()
        
        initUmeng()
        
        self.window?.rootViewController = configViewControllersWithOptions(launchOptions)
        
        initAppRating()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        Appirater.appEnteredForeground(true)
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    /**
    初始化友盟统计分析
    */
    func initUmeng() {
        #if (DEBUG)
            MobClick.startWithAppkey("5357ebe556240baefc0315f8", reportPolicy: REALTIME, channelId: "Development")
        #else
            MobClick.startWithAppkey("5357ebe556240baefc0315f8", reportPolicy: REALTIME, channelId: "App Store")
        #endif
        
        MobClick.setAppVersion(NSBundle.mainBundle().infoDictionary?["CFBundleShortVersionString"] as? String)
        
        UMFeedback.setAppkey("5357ebe556240baefc0315f8")
    }
    
    /**
    初始化App评级功能
    */
    func initAppRating() {
        Appirater.setAppId("974476273")
        Appirater.setDaysUntilPrompt(7)         //使用N天后跳出提示
        Appirater.setUsesUntilPrompt(7)         //使用N次后跳出提示
        Appirater.setTimeBeforeReminding(7)     //点击稍候提醒，设置N天后再提示
        Appirater.setOpenInAppStore(true)
        Appirater.setDebug(false)
        
        Appirater.appLaunched(true)
    }
    
    /**
    初始化界面元素
    
    :param: launchOptions 启动参数
    
    :returns: 根视图控制器
    */
    func configViewControllersWithOptions(launchOptions: [NSObject: AnyObject]?) -> UIViewController {
        //设置导航栏背景
        UINavigationBar.appearance().setBackgroundImage(UIImage.imageWithColor(UIColor(red: 189/255.0, green: 94/255.0, blue: 288/255.0, alpha: 1.0), forSize: CGSizeMake(1, 64)), forBarMetrics: UIBarMetrics.Default)
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont.boldSystemFontOfSize(20)]
        UINavigationBar.appearance().tintColor = UIColor.whiteColor();
        
        //配置侧边栏
        let worthViewController = WorthViewController(nibName: "WorthViewController", bundle: nil)
        let navigationController = UINavigationController(rootViewController: worthViewController)
        contentNavigationController = navigationController
        let menuViewController = SideMenuViewController()
        let sideMenu  = RESideMenu(contentViewController: navigationController, leftMenuViewController: menuViewController, rightMenuViewController: nil)
        sideMenu.delegate = self;
        var sideMenuBackgroud = UIImage.imageWithColor(UIColor.whiteColor(), forSize: CGSizeMake(3, 3))
        sideMenuBackgroud = sideMenuBackgroud.resizableImageWithCapInsets(UIEdgeInsetsMake(1, 1, 1, 1), resizingMode: UIImageResizingMode.Stretch)
        sideMenu.backgroundImage = sideMenuBackgroud
        sideMenu.panFromEdge = true;
        sideMenu.contentViewScaleValue = 0.6
        sideMenu.contentViewInPortraitOffsetCenterX = -0.2 * sideMenu.contentViewScaleValue * CGRectGetMidX(UIScreen.mainScreen().bounds)
        
        return sideMenu
    }

}

