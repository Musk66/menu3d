//
//  MenuItemCell.swift
//  menu3d
//
//  Created by tiger on 16/4/27.
//  Copyright © 2016年 tq. All rights reserved.
//

import Foundation
import UIKit

class MenuItemCell: UITableViewCell {
    
    @IBOutlet weak var menuItemImageView: UIImageView!
    
    func configForMenuItem(menuItem: NSDictionary) {
        menuItemImageView.image = UIImage(named: menuItem["image"] as! String)
        self.backgroundColor = UIColor(colorArray: menuItem["colors"] as! NSArray)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
    }
    
    override func setHighlighted(highlighted: Bool, animated: Bool) {
    }
}