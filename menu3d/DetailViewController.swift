//
//  DetailViewController.swift
//  menu3d
//
//  Created by tiger on 16/4/27.
//  Copyright © 2016年 tq. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    var hamburgerView: HamburgerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController!.navigationBar.clipsToBounds = true
        addLeftBarButtonItem()
    }
    
    //添加导航栏左边的按钮
    func addLeftBarButtonItem() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(DetailViewController.hamburgerViewTapped))
        hamburgerView = HamburgerView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        hamburgerView!.addGestureRecognizer(tapGesture)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: hamburgerView!)
    }
    
    //导航栏按钮点击事件
    func hamburgerViewTapped() {
        let navigationController = parentViewController as! UINavigationController
        let containerViewController = navigationController.parentViewController as! ContainerViewController
        containerViewController.hideOrShowMenu(!containerViewController.showingMenu, animated: true)
    }
    
    var menuItem: NSDictionary? {
        didSet {
            if let newMenuItem = menuItem {
                view.backgroundColor = UIColor(colorArray: newMenuItem["colors"] as! NSArray)
                backgroundImageView?.image = UIImage(named: newMenuItem["bigImage"] as! String)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}