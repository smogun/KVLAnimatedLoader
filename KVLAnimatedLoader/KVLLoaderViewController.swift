//
//  KVLLoaderViewController.swift
//  KVLAnimatedLoader
//
//  Created by Misha Koval on 12/6/15.
//  Copyright © 2015 Misha Koval. All rights reserved.
//

import Foundation
import UIKit

typealias Selectors_KVLLoaderViewController = KVLLoaderViewController


public class KVLLoaderViewController : UIViewController
{
    var loader : UIView? = nil;
    var width : CGFloat = 0.0;
    var loaderStarted : Bool = false;
    var loaderSize: Double = 0.0
    var gap : Double = 6
    var elementSize : Double = 0
    
    var startStopButton: UIButton? = nil;
    var addRemoveButton: UIButton? = nil;
    
    
    
    convenience init<T: UIView where T:protocol<KVLLoaderProtocol>> (loader: T!, width: CGFloat)
    {
        self.init();
        self.loader = loader;
        self.width = width;
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad();
        
        
        
        self.view.backgroundColor = UIColor.lightGrayColor()
        self.view.frame = CGRectMake(0, 0, self.width, self.width);
        
        
        
        
        self.elementSize = Double(self.width) / 3.0
        self.loaderSize = elementSize * 2.0 - gap / 2.0
        
        
        
        
        self.loader!.frame = CGRectMake(0, self.width / 2 - CGFloat(loaderSize) / 2, CGFloat(loaderSize), CGFloat(loaderSize))
        self.view.addSubview(self.loader!)
        
        addButtonsPane()
        
        startStopLoader()
    }
    
    
    private func addButtonsPane()
    {
        let buttonsPane = UIView();
        
        self.startStopButton = UIButton(type: UIButtonType.RoundedRect)
        self.startStopButton!.setTitle("Start", forState: .Normal)
        self.startStopButton!.titleLabel?.adjustsFontSizeToFitWidth = true
        self.startStopButton!.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.startStopButton!.addTarget(self, action: "startStopLoader", forControlEvents: .TouchUpInside);
        self.startStopButton!.frame = CGRectMake(0, 0, CGFloat(self.elementSize - self.gap * 1.5), 40)
        self.startStopButton!.backgroundColor = UIColor.grayColor()
        buttonsPane.addSubview(self.startStopButton!)
        
//        addRemoveButton = UIButton(type: UIButtonType.RoundedRect)
//        addRemoveButton!.setTitle("Remove", forState: .Normal)
//        addRemoveButton!.titleLabel?.adjustsFontSizeToFitWidth = true
//        addRemoveButton!.setTitleColor(UIColor.blackColor(), forState: .Normal)
//        addRemoveButton!.addTarget(self, action: "addRemoveLoader", forControlEvents: .TouchUpInside);
//        addRemoveButton!.frame = CGRectMake(0, startStopButton!.endY + CGFloat(self.gap), CGFloat(self.elementSize - self.gap * 1.5), 40)
//        addRemoveButton!.backgroundColor = UIColor.grayColor()
//        buttonsPane.addSubview(addRemoveButton!)
//        
//        
//        let buttonsPaneHeight = addRemoveButton!.endY;
        let buttonsPaneHeight = self.startStopButton!.endY;
        buttonsPane.frame = CGRectMake(self.loader!.endX + CGFloat(self.gap), self.width / 2 - buttonsPaneHeight / 2, self.startStopButton!.size.width, buttonsPaneHeight)
        
        
        self.view.addSubview(buttonsPane);
        
        
        
    }
    
}

extension Selectors_KVLLoaderViewController
{
    func startStopLoader()
    {
        let localLoader = self.loader as? KVLLoaderProtocol;
        if ((localLoader) != nil)
        {
            self.loaderStarted = !self.loaderStarted;
            
            if (self.loaderStarted)
            {
                localLoader!.startAnimating()
                startStopButton!.setTitle("Stop", forState: .Normal)
            }
            else
            {
                localLoader!.stopAnimating()
                startStopButton!.setTitle("Start", forState: .Normal)
            }
        }
        
    }
    
    func addRemoveLoader()
    {
        let localLoader = self.loader as? KVLLoaderProtocol;
        if ((localLoader) != nil)
        {
            if (self.loader!.superview == nil)
            {
                startStopButton!.enabled = true;
                self.view.addSubview(self.loader!)
                addRemoveButton!.setTitle("Remove", forState: .Normal)
            }
            else
            {
                startStopButton!.enabled = false;
                self.loaderStarted = true
                startStopLoader()
                self.loader!.removeFromSuperview()
                addRemoveButton!.setTitle("Re-Add", forState: .Normal)
            }
        }
    }
}