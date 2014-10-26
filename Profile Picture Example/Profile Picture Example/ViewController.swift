//
//  ViewController.swift
//  Profile Picture Example
//
//  Created by Akshay Lazarus on 10/25/14.
//  Copyright (c) 2014 Akshay Lazarus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.imageView.alpha = 0.0 //Hide imageView until we get the data
        let myProfilePicutreURL = NSURL(string: "http://graph.facebook.com/alexbloodworth/picture?type=square&width=640&height=640")
        let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.Gray)
        activityIndicatorView.center = self.view.center
        self.view.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            NSOperationQueue.mainQueue().addOperationWithBlock{
                // DO some async stuff
                let imageData = NSData(contentsOfURL: myProfilePicutreURL!)
                
                // Do some main threat stuff
                self.imageView.image = UIImage(data: imageData!)
                activityIndicatorView.stopAnimating()
                
                UIView.animateWithDuration(1.0,
                    animations: {
                        self.imageView.alpha = 1.0
                    }, completion: {
                        (value: Bool) in println("Animation complete!")
                    })
            }
        }
    }
}
