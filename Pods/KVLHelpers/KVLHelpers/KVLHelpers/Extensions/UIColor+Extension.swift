//
//  UIColor+Extension.swift
//  KVLArounder
//
//  Created by Misha Koval on 9/18/15.
//  Copyright (c) 2015 Misha Koval. All rights reserved.
//

import UIKit

/****************************************************************************************/
public func RandomColor() -> UIColor
{
    return UIColor.RGBA((CGFloat)(random() % 255), g: (CGFloat)(random() % 255), b: (CGFloat)(random() % 255), a: CGFloat(0.7))
}


public extension UIColor
{
    public class func RGBA(r: CGFloat,  g: CGFloat,  b: CGFloat,  a: CGFloat) -> UIColor
    {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
    public class func RGB(r: CGFloat,  g: CGFloat,  b: CGFloat) -> UIColor
    {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1.0)
    }
}