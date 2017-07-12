//
//  RootPageViewController.swift
//  Scorecard
//
//  Created by Greg on 7/11/17.
//  Copyright © 2017 gregMakesApps. All rights reserved.
//

import UIKit

class RootPageViewController: UIPageViewController, UIPageViewControllerDataSource {

    
    lazy var VCList: [UIViewController] = {
       
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let Hole1VC = sb.instantiateViewController(withIdentifier: "Hole1VC")
        
        let Hole2VC = sb.instantiateViewController(withIdentifier: "Hole2VC")
        
        let Hole3VC = sb.instantiateViewController(withIdentifier: "Hole3VC")
        
        let Hole4VC = sb.instantiateViewController(withIdentifier: "Hole4VC")
        let Hole5VC = sb.instantiateViewController(withIdentifier: "Hole5VC")
        
        return [Hole1VC, Hole2VC, Hole3VC, Hole4VC, Hole5VC]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self

        if let firstViewController = VCList.first {
            self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = VCList.index(of: viewController) else  {return nil}
        
        let previousIndex = vcIndex - 1
        
        guard previousIndex >= 0 else {return nil}
        
        guard VCList.count > previousIndex else {return nil}
        
        return VCList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = VCList.index(of: viewController) else  {return nil}
        
        let nextIndex = vcIndex + 1
        
        guard VCList.count != nextIndex else {return nil}
        
        guard VCList.count > nextIndex else {return nil}
        
        return VCList[nextIndex]
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
