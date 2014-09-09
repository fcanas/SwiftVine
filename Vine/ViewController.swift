//
//  ViewController.swift
//  Vine
//
//  Created by Fabian Canas on 9/7/14.
//  Copyright (c) 2014 Fabian Canas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var vineService = VineService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vineService.getVinesForTag("goats", completionHandler: { (goats, error) -> Void in
            NSLog("%@", error!)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

