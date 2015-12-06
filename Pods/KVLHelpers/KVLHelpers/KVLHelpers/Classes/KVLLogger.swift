//
//  KVLLogger.swift
//  KVLArounder
//
//  Created by Misha Koval on 9/14/15.
//  Copyright (c) 2015 Misha Koval. All rights reserved.
//

import Foundation

public typealias WHERE = String


/****************************************************************************************/
public func GetCodeLocation(file: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__, col: Int = __COLUMN__) -> WHERE!
{
    return String(format: "%@:%@:(%d,%d)", file.lastPathComponent!.stringByDeletingPathExtension!, function, line, col)
}


/*
IMPORTANT!  in order for this class to print, there is a need to add DEBUG flag in build settings for debug scheme.
If installed from pods, this has to be done in POD target:
(POD project -> Buld settings -> Swift compiler - Custom Flags -> other Swift Flags -> Debug -> add "-DDEBUG")
Since POD target is being assembled by pod install, pod file has to include "post_install" script (see example projects).
*/
@objc
public class KVLLogger: NSObject
{
    public class func printLogMessage(format: String, _ args: CVarArgType...)
    {
        #if DEBUG
            withVaList(args) { NSLogv(format, $0) }
        #endif
    }
    public class func printErrorMessage(message: String?, location: WHERE?)
    {
        printLogMessage("⛔️ %@ >>> %@", location == nil ? "" : location!, message == nil ? "" : message!)
    }
    
    public class func printSuccessMessage(message: String?, location: WHERE?)
    {
        printLogMessage("✅ %@ >>> %@", location == nil ? "" : location!, message == nil ? "" : message!)
    }
    
    public class func printNormalMessage(message: String?, location: WHERE?)
    {
        printLogMessage("➕ %@ >>> %@", location == nil ? "" : location!, message == nil ? "" : message!)
    }
    
    public class func printError(error: NSError?, location: WHERE?)
    {
        if (error == nil)
        {
            return;
        }
        
        let localizedRecoveryOptions:AnyObject? = error!.localizedRecoveryOptions
        let userInfo:AnyObject? = error!.userInfo
        
        printErrorMessage(String(format:"Description: %@\nFailureReason: %@\nRecoverySuggestion: %@\nRecoveryOptions: %@\nCode: %zd\nDomain: %@\nUserInfo: %@",
            error!.localizedDescription,
            error!.localizedFailureReason == nil ? "" : error!.localizedDescription,
            (error!.localizedRecoverySuggestion == nil ? "" : error!.localizedRecoverySuggestion)!,
            localizedRecoveryOptions == nil ? "" : localizedRecoveryOptions as! String,
            error!.code,
            error!.domain,
            userInfo == nil ? "" : userInfo as! NSDictionary), location: location == nil ? "" : location!);
    }
    
    public class func printException(exception: NSException?, location: WHERE?)
    {
        if (exception == nil)
        {
            return;
        }
        printErrorMessage(String(format:"Name: %@\nReason: %@, stackTrace:%@",
            exception!.name,
            exception!.reason!,
            exception!.callStackSymbols), location: location == nil ? "" : location!);
    }
}