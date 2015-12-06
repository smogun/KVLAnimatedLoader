//
//  KVLJumpingDotsLoader.swift
//  KVLAnimatedLoader
//
//  Created by Misha Koval on 12/20/15.
//  Copyright © 2015 Misha Koval. All rights reserved.
//

import Foundation
import UIKit
import KVLHelpers

public enum JumpingLoaderType
{
    case Normal, Wave
}

typealias KVLLoaderProtocol_KVLJumpingDotsLoader = KVLJumpingDotsLoader

public class KVLJumpingDotsLoader : UIView, KVLLoaderProtocol
{
    public var animationDurationSec : CFTimeInterval = 3.0; //Seconds
    public var numberOfJumpers: UInt = 3;
    public var gapBetweenDots: CGFloat = 10;
    public var loaderType: JumpingLoaderType = .Wave
    
    
    private var jumpersView: UIView? = nil;
    private var image: UIImage? = nil;
    private var jumpersArray: NSMutableArray! = NSMutableArray();
    
    private var currentDotNum: UInt = 0;
    private var jumpersTimer: NSTimer? = nil;
    
    override public func didMoveToWindow() {
        super.didMoveToWindow();
        
        if (super.window == nil)
        {
            self.stopAnimating()
        }
        
    }
    
    
    convenience init (imageName: String)
    {
        self.init()
        
        self.image = UIImage(named: imageName)
        
        if (self.image == nil)
        {
            self.image = UIImage();
        }
        
        let leftGap = self.gapBetweenDots;
        let rightGap = self.gapBetweenDots;
        let topGap = self.gapBetweenDots;
        let bottomGap = self.gapBetweenDots;
        
        let totalHorizontalGaps = leftGap + rightGap + CGFloat(self.numberOfJumpers - 1) * self.gapBetweenDots;
        let totalVerticalGaps = topGap + bottomGap;
        
        let desiredWidth = CGFloat(self.numberOfJumpers) * self.image!.size.width + totalHorizontalGaps;
        let desiredHeight = self.image!.size.height + totalVerticalGaps;
        
        self.frame = CGRectMake(0, 0, desiredWidth, desiredHeight);
        self.jumpersView = UIView(frame: self.frame);
        self.jumpersView!.autoresizingMask = [.FlexibleBottomMargin, .FlexibleTopMargin, .FlexibleLeftMargin, .FlexibleRightMargin];
        self.addSubview(self.jumpersView!);
        
        self.jumpersView!.backgroundColor = RandomColor()
        
        
        
        for var i:UInt = 0; i < self.numberOfJumpers; ++i
        {
            let jumper = UIImageView(image: self.image);
            jumper.frame = CGRectMake(
                self.gapBetweenDots + CGFloat(self.currentDotNum) * (self.image!.size.width + self.gapBetweenDots),
                self.size.height / 2 - self.image!.size.height / 2,
                self.image!.size.width,
                self.image!.size.height
            )
            
            ++self.currentDotNum;
            self.jumpersView!.addSubview(jumper);
            self.jumpersArray.addObject(jumper);
        }
    }
    
    
    public func jumpersTimerFired()
    {
        let jumpTime = self.animationDurationSec / CFTimeInterval(self.jumpersArray.count + 1);
        for var i:Int = 0; i < self.jumpersArray.count; ++i
        {
            let jumper: UIImageView = self.jumpersArray.objectAtIndex(i) as! UIImageView;
            let jumpDistance = min(self.gapBetweenDots, jumper.size.height);
            
            var delay = NSTimeInterval(Double(i) * jumpTime);
            if (self.loaderType == .Wave)
            {
                delay = NSTimeInterval(Double(i) * jumpTime / Double(self.jumpersArray.count))
            }
            
            
            UIView.animateKeyframesWithDuration(jumpTime, delay: delay, options: UIViewKeyframeAnimationOptions(rawValue: 0), animations: { () -> Void in
                
                UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: jumpTime / 2.0, animations: { () -> Void in
                    jumper.frame = CGRectMake(
                        jumper.frame.origin.x,
                        jumper.frame.origin.y - jumpDistance,
                        jumper.frame.size.width,
                        jumper.frame.size.height)
                });
                
                UIView.addKeyframeWithRelativeStartTime(jumpTime / 2.0, relativeDuration: jumpTime / 2.0, animations: { () -> Void in
                    jumper.frame = CGRectMake(
                        jumper.frame.origin.x,
                        jumper.frame.origin.y + jumpDistance,
                        jumper.frame.size.width,
                        jumper.frame.size.height)
                });
                
                
                }, completion: nil);
        }
    }
}

extension KVLLoaderProtocol_KVLJumpingDotsLoader
{
    public func startAnimating() {
        self.jumpersTimer = NSTimer(
            timeInterval: self.animationDurationSec,
            target: self,
            selector: "jumpersTimerFired",
            userInfo: nil,
            repeats: true)
        NSRunLoop.currentRunLoop().addTimer(self.jumpersTimer!, forMode: NSRunLoopCommonModes)
        self.jumpersTimer!.fire();
        
    }
    
    public func stopAnimating() {
        self.layer.removeAllAnimations();
        self.jumpersTimer!.invalidate();
        self.jumpersTimer = nil;
    }
}