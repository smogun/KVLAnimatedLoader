//
//  KVLRotationLoader.swift
//  KVLAnimatedLoader
//
//  Created by Misha Koval on 12/6/15.
//  Copyright © 2015 Misha Koval. All rights reserved.
//

import Foundation
import UIKit

typealias KVLLoaderProtocol_KVLRotationLoader = KVLRotationLoader

public class KVLRotationLoader : UIImageView, KVLLoaderProtocol
{
    public var animationDurationSec : CFTimeInterval = 3.0; //Seconds
    public var clockwize : Bool = true;

    override public var image: UIImage?
    {
        get {return super.image}
        set {
            super.image = newValue
            
            if (super.image != nil)
            {
                self.frame = CGRectMake(self.origin.x, self.origin.y, super.image!.size.width, super.image!.size.height)
            }
        }
    }
    
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
    }
}

extension KVLLoaderProtocol_KVLRotationLoader
{
    public override func startAnimating() {
        let rotationAnim = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnim.toValue = NSNumber(double: M_PI * 2.0 * (clockwize ? 1 : -1))
        rotationAnim.duration = self.animationDurationSec;
        rotationAnim.cumulative = true;
        rotationAnim.repeatCount = .infinity;

        self.layer.addAnimation(rotationAnim, forKey: "rotationLoaderRotationAnimation")
    }
    
    public override func stopAnimating() {
        self.layer.removeAllAnimations()
    }
}