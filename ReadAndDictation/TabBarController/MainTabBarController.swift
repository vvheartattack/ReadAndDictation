//
//  MainTabBarController.swift
//  ReadAndDictation
//
//  Created by 江美佳 on 2021/5/25.
//

import UIKit

class MainTabBarController: UITabBarController {
    let middleButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTabBar()
    
        // Do any additional setup after loading the view.
    }
    
    func setUpMiddleButton() {
        // Set up middleButton
        middleButton.setImage(UIImage(named: "tab栏／icon／加号"), for: .normal)
        middleButton.layer.masksToBounds = true
        middleButton.contentEdgeInsets = .init(top: 5, left: 16, bottom: 16, right: 16)
        middleButton.addTarget(self, action: #selector(middleButtonTapped(button:)), for: .touchUpInside)
        tabBar.addSubview(middleButton)
        middleButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            middleButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1 / 3),
            middleButton.centerXAnchor.constraint(equalTo: self.tabBar.centerXAnchor),
            middleButton.topAnchor.constraint(equalTo: self.tabBar.topAnchor)
        ])
        middleButton.addTarget(self, action: #selector(middleButtonTapped(button:)), for: .touchUpInside)
    }
    
    @objc func middleButtonTapped(button: UIButton) {
        let extensionToolViewController = ExtensionToolViewController()
        extensionToolViewController.modalPresentationStyle = .overFullScreen
//        extensionToolViewController.modalPresentationStyle = .blur
        extensionToolViewController.modalTransitionStyle = .coverVertical
        self.present(extensionToolViewController, animated: true, completion: nil)
        
//        self.modalPresentationStyle = .fullScreen
        
    }
    
    func initTabBar() {
        let home =  UINavigationController(rootViewController: HomeViewController())
        home.tabBarItem.title = "首页"
        home.tabBarItem.image = UIImage(named: "tab栏／icon／课本／选中")
        
        let myPage = UINavigationController(rootViewController: MyPageViewController())
        myPage.tabBarItem.title = "我的"
        myPage.tabBarItem.image = UIImage(named: "矩形备份 2")
        
        let extensionTool = ExtensionToolViewController()
        extensionTool.tabBarItem.title = ""
        
        viewControllers = [home, extensionTool, myPage]
        
        // Set up tabBar and tabBarItem
        setTabBarItemAttributes(bgColor: UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1))
        
        setUpMiddleButton()
        
    }
    
    func setTabBarItemAttributes(fontName: String = "PingFang SC",
                                 fontSize: CGFloat = 14,
                                 normalColor: UIColor = .gray,
                                 selectedColor: UIColor = .systemBlue,
                                 bgColor: UIColor = .white) {
        // tarBarItem 文字大小
        var attributes: [NSAttributedString.Key: Any] = [.font: UIFont(name: fontName, size: fontSize)!]
        
        // tabBarItem 文字默认颜色
        attributes[.foregroundColor] = normalColor
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .normal)
        
        // tabBarItem 文字选中颜色
        attributes[.foregroundColor] = selectedColor
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .selected)
//
        // tabBar 文字、图片 统一选中高亮色
        tabBar.tintColor = selectedColor
        
        // tabBar 背景色
        tabBar.barTintColor = bgColor
        
    }
    

   

}
