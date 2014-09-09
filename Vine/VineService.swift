//
//  VineService.swift
//  SwiftVine
//
//  Created by Fabian Canas on 9/7/14.
//  Copyright (c) 2014 Fabian Canas. All rights reserved.
//

import UIKit

class VineService: NSObject {
    
    let urlSession = NSURLSession.sharedSession()
    
    func getVinesForTag(tag: String, completionHandler: ((NSArray!, NSError!) -> Void)) {
        let apiString = "https://api.vineapp.com/timelines/tags/goat"
        let urlComponents = NSURLComponents()
        
        urlComponents.scheme = "https"
        urlComponents.host = "api.vineapp.com"
        urlComponents.path = "/timelines/tags/" + tag
        
        var task = urlSession.dataTaskWithURL(urlComponents.URL!, completionHandler: { (data, response, error) -> Void in
            var error: NSError?
            var responseDict: Dictionary<String, AnyObject>? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: &error) as Dictionary<String, AnyObject>?
            
//            let code = responseDict?.objectForKey("code")
//            NSLog("code: \(code!)");
            let data: Dictionary<String, AnyObject>? = responseDict?["data"] as Dictionary<String, AnyObject>?
            let records = data["records"] as Array?
            
            NSLog("records : \(records)")
            
            var keys = responseDict?.keyEnumerator().allObjects
            NSLog("%@", keys!);
        })
        task.resume()
    }
}
