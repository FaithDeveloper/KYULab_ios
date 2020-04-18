//
//  ViewController.swift
//  SampleCustomTabbar
//
//  Created by kchshin on 2018. 12. 18..
//  Copyright © 2018년 kcs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtMessage: UILabel!
    @IBOutlet weak var menuScrollView: UIScrollView!
    var viewFromNib: [MenuItemView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 탭바에 표시할 View을 nib에서 가져온다.
        for i in 0 ..< 4 {
            if let nib = Bundle.main.loadNibNamed("MenuItemView",
                                                  owner: nil,
                                                  options: nil)?.first as? MenuItemView {
                let posX = nib.frame.width * (CGFloat)(i)
                nib.frame = CGRect(x: posX, y: 0, width: nib.frame.width, height: nib.frame.height)
                
                if i != 0 {
                    nib.viewBottomMenuBar.isHidden = true
                }
                nib.setPosition(i)
                nib.btnMenuBar.setTitle("Menu \(i)", for: .normal)
                
                viewFromNib.append(nib)
                menuScrollView.addSubview(nib)
                
            }
        }
                
        // 예외 처리
        if viewFromNib.count == 0 {
            return
        }
        
        menuScrollView.contentSize = CGSize(width: viewFromNib[0].frame.width * (CGFloat)(viewFromNib.count), height: menuScrollView.frame.height)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(menubarClickListener(_:)),
                                               name: NSNotification.Name(rawValue:
                                                "click"),
                                               object: nil)
    }

    
    /// 메뉴 상단 버튼 클릭에 따른 이벤트
    /// - Parameter notification: notification
    @objc func menubarClickListener(_ notification:NSNotification){
        let noti = notification.object
        if notification.name.rawValue != "click"{
            return
        }
        let postion = noti as! Int
        print("Hellow Menu \(postion)")
        
        for nib in viewFromNib {
            nib.viewBottomMenuBar.isHidden = true
        }
        
        viewFromNib[postion].viewBottomMenuBar.isHidden = false
        
        txtMessage.text = "Hellow Menu \(postion)"
    }

}

