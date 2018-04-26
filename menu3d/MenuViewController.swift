//
//  MenuViewController.swift
//  menu3d
//
//  Created by tiger on 16/4/27.
//  Copyright © 2016年 tq. All rights reserved.
//

import Foundation
import UIKit

class MenuViewController: UITableViewController {
    
    lazy var menuItems: NSArray = {
        let path = NSBundle.mainBundle().pathForResource("MenuItems", ofType: "plist")
        return NSArray(contentsOfFile: path!)!
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //去掉navbar的下边线
        navigationController!.navigationBar.clipsToBounds = true
        
        //默认选中第一行
//        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
//        tableView.selectRowAtIndexPath(indexPath, animated: true, scrollPosition: UITableViewScrollPosition.Top)
//        let menuItem = menuItems[indexPath.row] as! NSDictionary
//        (navigationController?.parentViewController as! ContainerViewController).menuItem = menuItem
        
        //默认选中第一行
        (navigationController!.parentViewController as! ContainerViewController).menuItem = (menuItems[0] as! NSDictionary)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MenuItemCell") as! MenuItemCell
        let menuItem = menuItems[indexPath.row] as! NSDictionary
        cell.configForMenuItem(menuItem)
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return max(80, CGRectGetHeight(view.frame)/CGFloat(menuItems.count))
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let menuItem = menuItems[indexPath.row] as! NSDictionary
        (navigationController?.parentViewController as! ContainerViewController).menuItem = menuItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
