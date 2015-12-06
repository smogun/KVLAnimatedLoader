//
//  NSDictionary+Extensions.swift
//  KVLArounder
//
//  Created by Misha Koval on 9/18/15.
//  Copyright (c) 2015 Misha Koval. All rights reserved.
//

import Foundation

public extension NSDictionary
{
    /****************************************************************************************/
    public func getString(key: String!) -> String!
    {
        let value: AnyObject? =  valueForKey(key)
        if (value == nil)
        {
            return ""
        }
        else
            if (value is String == false)
            {
                KVLLogger.printErrorMessage(String(format: "Tried to fetch \"String\" for key \"%@\" but got type: \"\(value!.dynamicType)\"", key), location: GetCodeLocation())
                return ""
        }
        
        return value as! String
    }
    
    
    /****************************************************************************************/
    public func getNumber(key: String!) -> NSNumber!
    {
        let value: AnyObject? =  valueForKey(key)
        if (value == nil)
        {
            return NSNumber(integer: 0)
        }
        else
            if (value is NSNumber == false)
            {
                KVLLogger.printErrorMessage(String(format: "Tried to fetch \"NSNumber\" for key \"%@\" but got type: \"\(value!.dynamicType)\"", key), location: GetCodeLocation())
                return NSNumber(integer: 0)
        }
        
        return value as! NSNumber
    }
    
    
    
    /****************************************************************************************/
    public func getArray(key: String!) -> NSArray!
    {
        let value: AnyObject? =  valueForKey(key)
        if (value == nil)
        {
            return NSArray()
        }
        else
            if (value is NSArray == false)
            {
                KVLLogger.printErrorMessage(String(format: "Tried to fetch \"NSArray\" for key \"%@\" but got type: \"\(value!.dynamicType)\"", key), location: GetCodeLocation())
                return NSArray()
        }
        
        return value as! NSArray
    }
    
    
    
    /****************************************************************************************/
    public func getDict(key: String!) -> NSDictionary!
    {
        let value: AnyObject? =  valueForKey(key)
        if (value == nil)
        {
            return NSDictionary()
        }
        else
            if (value is NSDictionary == false)
            {
                KVLLogger.printErrorMessage(String(format: "Tried to fetch \"String\" for key \"%@\" but got type: \"\(value!.dynamicType)\"", key), location: GetCodeLocation())
                return NSDictionary()
        }
        
        return value as! NSDictionary
    }
}
