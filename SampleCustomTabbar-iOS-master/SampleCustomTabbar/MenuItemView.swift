//
//  MenuView.swift
//  SampleCustomTabbar
//
//  Created by kchshin on 2018. 12. 18..
//  Copyright © 2018년 kcs. All rights reserved.
//

import UIKit

class MenuItemView: UIView{
    @IBOutlet weak var btnMenuBar: UIButton!
    @IBOutlet var viewBottomMenuBar : UIView!
    
    var position = 0
    
    func setPosition(_ position: Int){
        self.position = position
    }
    
    @IBAction func actionMenuBar(_ sender: Any) {
         NotificationCenter.default.post(name: Notification.Name(rawValue:  "click"), object: position)
    }
    
}
