//
//  HomePageViewController.swift
//  ReadAndDictation
//
//  Created by 江美佳 on 2021/6/1.
//

import UIKit

class HomePageViewController: UIPageViewController, PageableViewController {
    private var pages = [UIViewController]()
    var subScrollViews = [UIScrollView]()
    var currentSubScrollView: UIScrollView {
        get {
            subScrollViews[currentPageIndex]
        }
    }
    var subScrollViewDelegate: SubScrollViewDelegate?
    
    private let pageControl = UIPageControl()
    private var currentPageIndex = 0
    
    
    lazy var controlView: UIView = {
        let controlView = UIView()
        controlView.backgroundColor = .white
        self.view.addSubview(controlView)
        return controlView
    }()
    
    lazy var afterSchoolLabel: UILabel = {
        let afterSchoolLabel = UILabel()
        afterSchoolLabel.text = "课外"
        afterSchoolLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        afterSchoolLabel.textColor = #colorLiteral(red: 0, green: 0.5019607843, blue: 1, alpha: 1)
        controlView.addSubview(afterSchoolLabel)
        afterSchoolLabel.isUserInteractionEnabled = true
        afterSchoolLabel.addGestureRecognizer(tapAfterSchoolLabelRecognizer)
        return afterSchoolLabel
    }()
    
    lazy var entranceForSchoolLabel: UILabel = {
        let entranceForSchoolLabel = UILabel()
        entranceForSchoolLabel.text = "升学"
        entranceForSchoolLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        entranceForSchoolLabel.textColor = #colorLiteral(red: 0.7647058824, green: 0.7647058824, blue: 0.7647058824, alpha: 1)
        controlView.addSubview(entranceForSchoolLabel)
        entranceForSchoolLabel.isUserInteractionEnabled = true
        entranceForSchoolLabel.addGestureRecognizer(tapEntranceForSchoolLabelRecognizer)
        return entranceForSchoolLabel
    }()
    
    lazy var afterSchoolUnderlineView: UIView = {
        let afterSchoolUnderlineView = UIView()
        afterSchoolUnderlineView.backgroundColor = #colorLiteral(red: 0, green: 0.5019607843, blue: 1, alpha: 1)
        controlView.addSubview(afterSchoolUnderlineView)
        return afterSchoolUnderlineView
    }()
    
    lazy var entranceForSchoolUnderlineView: UIView = {
        let entranceForSchoolUnderlineView = UIView()
        entranceForSchoolUnderlineView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        controlView.addSubview(entranceForSchoolUnderlineView)
        return entranceForSchoolUnderlineView
    }()
    
    lazy var dividingLineView: UIView = {
        let dividingLineView = UIView()
        dividingLineView.backgroundColor = #colorLiteral(red: 0.9098039216, green: 0.9098039216, blue: 0.9098039216, alpha: 1)
        self.view.addSubview(dividingLineView)
        return dividingLineView
    }()
    
    lazy var tapAfterSchoolLabelRecognizer: UITapGestureRecognizer = {
        let tapAfterSchoolLabelRecognizer = UITapGestureRecognizer(target: self, action: #selector(afterSchoolLabelTapped(_:)))
        return tapAfterSchoolLabelRecognizer
    }()
    
    lazy var tapEntranceForSchoolLabelRecognizer: UITapGestureRecognizer = {
        let tapEntranceForSchoolLabelRecognizer = UITapGestureRecognizer(target: self, action: #selector(entranceForSchoolLabelTapped(_:)))
        return tapEntranceForSchoolLabelRecognizer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        layout()
        // Do any additional setup after loading the view.
    }
}

extension HomePageViewController {
    
    
    func setUp() {
        dataSource = self
        delegate = self
        
        
        // create an  array of view controllers
        let afterSchoolViewController = AfterSchoolViewController()
        let entranceForSchoolViewController = EntranceForSchoolViewController()
        
        
        pages.append(afterSchoolViewController)
        afterSchoolViewController.subScrollViewDelegate = subScrollViewDelegate
        subScrollViews.append(afterSchoolViewController.afterSchoolTableView)
        pages.append(entranceForSchoolViewController)
        entranceForSchoolViewController.subScrollViewDelegate = subScrollViewDelegate
        subScrollViews.append(entranceForSchoolViewController.entranceForSchoolTableView)
        setViewControllers([pages[currentPageIndex]], direction: .reverse, animated: true, completion: nil)
    }

    func layout() {
        controlView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(49)
        }
        
        afterSchoolLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(16)
        }
        entranceForSchoolLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(afterSchoolLabel.snp.trailing).offset(28)
            make.top.equalToSuperview().offset(16)
        }
        
        afterSchoolUnderlineView.snp.makeConstraints { (make) in
            make.width.equalTo(24)
            make.height.equalTo(1)
            make.centerX.equalTo(afterSchoolLabel.snp.centerX)
            make.bottom.equalToSuperview()
        }
        
        
        entranceForSchoolUnderlineView.snp.makeConstraints { (make) in
            make.width.equalTo(24)
            make.height.equalTo(1)
            make.centerX.equalTo(entranceForSchoolLabel.snp.centerX)
            make.bottom.equalToSuperview()
        }
        
        
        dividingLineView.snp.makeConstraints { (make) in
            make.height.equalTo(0.5)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(controlView.snp.bottom)
        }
        
    }
}

extension HomePageViewController {
    
    @objc func afterSchoolLabelTapped(_ recognizer: UITapGestureRecognizer) {
        afterSchoolLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        afterSchoolLabel.textColor = #colorLiteral(red: 0, green: 0.5019607843, blue: 1, alpha: 1)
        entranceForSchoolLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        entranceForSchoolLabel.textColor = #colorLiteral(red: 0.7647058824, green: 0.7647058824, blue: 0.7647058824, alpha: 1)
        afterSchoolUnderlineView.backgroundColor = #colorLiteral(red: 0, green: 0.5019607843, blue: 1, alpha: 1)
        entranceForSchoolUnderlineView.backgroundColor = .white
        currentPageIndex = 0
        setViewControllers([pages[currentPageIndex]], direction: .reverse, animated: true, completion: nil)
    }
    
    @objc func entranceForSchoolLabelTapped(_ recognizer: UITapGestureRecognizer) {
        entranceForSchoolLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        entranceForSchoolLabel.textColor = #colorLiteral(red: 0, green: 0.5019607843, blue: 1, alpha: 1)
        afterSchoolLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        afterSchoolLabel.textColor = #colorLiteral(red: 0.7647058824, green: 0.7647058824, blue: 0.7647058824, alpha: 1)
        entranceForSchoolUnderlineView.backgroundColor = #colorLiteral(red: 0, green: 0.5019607843, blue: 1, alpha: 1)
        afterSchoolUnderlineView.backgroundColor = .white
        currentPageIndex = 1
        setViewControllers([pages[currentPageIndex]], direction: .forward, animated: true, completion: nil)
    }
    
}

extension HomePageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            guard let viewControllers = pageViewController.viewControllers else { return }
            guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }
            
            if currentIndex == 0 {
                afterSchoolLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
                afterSchoolLabel.textColor = #colorLiteral(red: 0, green: 0.5019607843, blue: 1, alpha: 1)
                entranceForSchoolLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
                entranceForSchoolLabel.textColor = #colorLiteral(red: 0.7647058824, green: 0.7647058824, blue: 0.7647058824, alpha: 1)
                afterSchoolUnderlineView.backgroundColor = #colorLiteral(red: 0, green: 0.5019607843, blue: 1, alpha: 1)
                entranceForSchoolUnderlineView.backgroundColor = .white
            } else {
                entranceForSchoolLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
                entranceForSchoolLabel.textColor = #colorLiteral(red: 0, green: 0.5019607843, blue: 1, alpha: 1)
                afterSchoolLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
                afterSchoolLabel.textColor = #colorLiteral(red: 0.7647058824, green: 0.7647058824, blue: 0.7647058824, alpha: 1)
                entranceForSchoolUnderlineView.backgroundColor = #colorLiteral(red: 0, green: 0.5019607843, blue: 1, alpha: 1)
                afterSchoolUnderlineView.backgroundColor = .white
                setViewControllers([pages[1]], direction: .forward, animated: true, completion: nil)
            }
        }
}

extension HomePageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if currentPageIndex != 0 {
            return pages[currentPageIndex - 1]
        }else {
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if currentPageIndex < pages.count - 1 {
            return pages[currentPageIndex + 1]
        } else {
            return nil
        }
    }
    
    
}
