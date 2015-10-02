//
//  ViewController.swift
//  todo-client2
//
//  Created by Shigeru on 2015/09/30.
//  Copyright © 2015年 concigel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadJson()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadJson() {
        let url = "https://192.168.24.42:9443/api/todos"
        //let queue   = NSOperationQueue.mainQueue()
        let config  = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: config)
        let request = NSURLRequest(URL: NSURL(string: url)!)
        //NSURLConnection.sendAsynchronousRequest(request, queue:queue)
        let task = session.dataTaskWithRequest(request, completionHandler: {
            (response, data, error) in
                //let jsonString = NSString(data: data!, encoding: NSASCIIStringEncoding) as! String
                
                let json = JSON(url: url)
                
                print(json)
            
            })
        task.resume()
    }

}

