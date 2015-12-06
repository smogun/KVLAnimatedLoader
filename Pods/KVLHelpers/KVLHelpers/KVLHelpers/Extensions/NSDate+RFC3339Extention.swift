//
//  NSDate+RFC3339Extention.swift
//  KVLArounder
//
//  Created by Misha Koval on 9/18/15.
//  Copyright (c) 2015 Misha Koval. All rights reserved.
//

import Foundation

public extension NSDate
{
    
    //This is most common format
    private static var RFC3339DateFormat1 = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'";
    private static var RFC3339DateFormat2 = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'ms'Z'";
    private static var RFC3339DateFormat3 = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'-'HH':'mm'";
    
    private class func getRFC3339DateFormatter(format: String) -> NSDateFormatter
    {
        let enUSPOSIXLocale: NSLocale? = NSLocale(localeIdentifier: "en_US_POSIX")
        assert(enUSPOSIXLocale != nil, "enUSPOSIXLocale must not be nil")
        
        let dateFormatter:NSDateFormatter? = NSDateFormatter()
        assert(dateFormatter != nil, "dateFormatter must not be nil")
        
        dateFormatter!.locale = enUSPOSIXLocale;
        dateFormatter!.dateFormat = format
        dateFormatter!.timeZone = NSTimeZone(forSecondsFromGMT:0);
        
        return dateFormatter!;
    }
    
    
    
    // Returns a user-visible date time string that corresponds to the
    // specified RFC 3339 date time string. Note that this does not handle
    // all possible RFC 3339 date time strings, just some of the most common
    // styles.
    @objc
    public class func userVisibleDateFromRFC3339DateTimeString(rfc3339DateTimeString: String?) -> NSDate?
    {
        if (rfc3339DateTimeString == nil)
        {
            return nil;
        }
        let format1Date = getRFC3339DateFormatter(RFC3339DateFormat1).dateFromString(rfc3339DateTimeString!);
        if (format1Date != nil)
        {
            return format1Date
        }
        
        let format2Date = getRFC3339DateFormatter(RFC3339DateFormat2).dateFromString(rfc3339DateTimeString!);
        if (format2Date != nil)
        {
            return format2Date
        }
        return getRFC3339DateFormatter(RFC3339DateFormat3).dateFromString(rfc3339DateTimeString!);
    }
    
    
    
    
    @objc
    public class func userVisibleDateTimeStringForRFC3339FromDate(date: NSDate?) -> String?
    {
        if (date == nil)
        {
            return nil;
        }
        return getRFC3339DateFormatter(RFC3339DateFormat1).stringFromDate(date!)
    }
    
    
    
    @objc
    public class func userVisibleStringForRFC3339FromCurrentDate() -> String?
    {
        let currentDate: NSDate? = NSDate();
        if (currentDate == nil)
        {
            return nil;
        }
        return NSDate.userVisibleDateTimeStringForRFC3339FromDate(currentDate!)
    }
}