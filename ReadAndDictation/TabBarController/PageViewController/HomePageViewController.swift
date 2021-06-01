//
//  HomePageViewController.swift
//  ReadAndDictation
//
//  Created by 江美佳 on 2021/6/1.
//

import UIKit

class HomePageViewController: UIPageViewController {
    var pages = [UIViewController]()
    let pageControl = UIPageControl()
    let initialPage = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        style()
        layout()
        // Do any additional setup after loading the view.
    }
}

extension HomePageViewController {
    func setUp() {
        dataSource = self
        delegate = self
        
        pageControl.addTarget(self, action: #selector(pageControlTapped(_:)), for: .valueChanged)
        // create an  array of view controllers
        let afterSchoolViewController = AfterSchoolViewController()
        let entranceForSchoolViewController = EntranceForSchoolViewController()
        
        pages.append(afterSchoolViewController)
        pages.append(entranceForSchoolViewController)
        
        // set up the initial view controller to be displayed
        setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
    }
    
    func style() {
        pageControl.currentPageIndicatorTintColor = .systemBlue
        pageControl.pageIndicatorTintColor = .systemGray2
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = initialPage
    }
    
    func layout() {
        self.view.addSubview(pageControl)
        pageControl.snp.makeConstraints { (make) in
            make.top.width.equalToSuperview()
            make.height.equalTo(49)
        }
    }
}

extension HomePageViewController {
    @objc func pageControlTapped(_ sender: UIPageControl) {
            setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true, completion: nil)
    }
}

extension HomePageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            guard let viewControllers = pageViewController.viewControllers else { return }
            guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }
            
            pageControl.currentPage = currentIndex
        }
}

extension HomePageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        if currentIndex == 0 {
            return pages.last
        } else {
            return pages[currentIndex - 1]
        }
//        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        if currentIndex < pages.count - 1 {
            return pages[currentIndex + 1]
        } else {
            return pages.first
        }
//        return nil
    }
    
    
}
