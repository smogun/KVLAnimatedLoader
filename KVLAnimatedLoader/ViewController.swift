//
//  ViewController.swift
//  KVLAnimatedLoader
//
//  Created by Misha Koval on 12/6/15.
//  Copyright © 2015 Misha Koval. All rights reserved.
//

import UIKit
import KVLHelpers

class ViewController: UIViewController {

    var c : UIViewController? = nil;
    var scrollView: UIScrollView? = nil;
    
    let loaderControllers = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = RandomColor();
        
        self.scrollView = UIScrollView(frame: CGRectMake(0, 0, self.view.size.width, self.view.size.height));
        self.scrollView!.contentSize = CGSizeMake(self.view.size.width, 0)
        self.view.addSubview(self.scrollView!);
        
        
        
        let rotationLoader = KVLRotationLoader(imageName: "loader");
        rotationLoader.clockwize = false;
        rotationLoader.animationDurationSec = 1;
        addLoaderToScrollView(rotationLoader);
        

        let jumpingLoader = KVLJumpingDotsLoader(imageName: "dot");
        jumpingLoader.numberOfJumpers = 3;
        jumpingLoader.loaderType = .Wave;
        jumpingLoader.animationDurationSec = 2.5;
        addLoaderToScrollView(jumpingLoader);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func addLoaderToScrollView<T: UIView where T:protocol<KVLLoaderProtocol>> (loader: T!)
    {
        if (self.scrollView == nil)
        {
            return;
        }
        
        let loaderController =  KVLLoaderViewController(loader: loader, width: 200);
        
        loaderController.view.frame = CGRectMake(
            self.scrollView!.size.width / 2 - loaderController.view.size.width / 2,
            self.scrollView!.contentSize.height + 10,
            loaderController.view.size.width,
            loaderController.view.size.height)
        self.loaderControllers.addObject(loaderController)
        
        self.scrollView!.addSubview(loaderController.view)
        self.scrollView!.contentSize = CGSizeMake(self.scrollView!.contentSize.width, loaderController.view.endY + 10)
    }

}

