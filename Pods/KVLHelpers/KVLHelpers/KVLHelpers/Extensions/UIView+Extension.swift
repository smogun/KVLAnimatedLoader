//
//  UIView+Extension.swift
//  KVLArounder
//
//  Created by Misha Koval on 9/18/15.
//  Copyright (c) 2015 Misha Koval. All rights reserved.
//

import UIKit

public extension UIView
{
    /**
    * Shortcut for frame.origin
    */
    public var origin:CGPoint{get{return self.frame.origin}}
    
    
    
    
    /**
    * Shortcut for frame.size
    */
    public var size:CGSize{get{return self.frame.size}}
    
    
    
    
    /**
    * Shortcut for frame.origin.x + width
    */
    public var endX:CGFloat{get{return self.frame.origin.x + self.frame.size.width}}
    
    
    
    
    /**
    * Shortcut for frame.origin.y + frame.size.height
    */
    public var endY:CGFloat{get{return self.frame.origin.y + self.frame.size.height}}
    
    
    
    
    /**
    * Shortcut to add subview at center of view
    */
    public func addSubviewAtCenter(subView: UIView?)
    {
        if (subView == nil)
        {
            return;
        }
        
        var subViewFrame = subView!.frame;
        subViewFrame.origin.x = self.size.width / 2 - subViewFrame.size.width / 2;
        subViewFrame.origin.y = self.size.height / 2 - subViewFrame.size.height / 2;
        subView!.frame = subViewFrame;
        self.addSubview(subView!);
    }
    
    
    
    
    /**
    * Shortcut to add subview at center of view horizontally
    */
    public func addSubviewAtCenterHorizontally(subView: UIView?, originY: CGFloat)
    {
        if (subView == nil)
        {
            return;
        }
        
        var subViewFrame = subView!.frame;
        subViewFrame.origin.x = self.size.width / 2 - subViewFrame.size.width / 2;
        subViewFrame.origin.y = originY;
        subView!.frame = subViewFrame;
        self.addSubview(subView!);
    }
}