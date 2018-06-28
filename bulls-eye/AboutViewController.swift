//
//  AboutViewController.swift
//  bulls-eye
//
//  Created by Arsalan Wahid Asghar on 6/28/18.
//  Copyright © 2018 Arsalan Wahid Asghar. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //load data from the html file
        let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html")
        let myRequest = URLRequest(url: url!)
        webView.load(myRequest)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func clos(){
        dismiss(animated: true, completion: nil)
    }
    

}
