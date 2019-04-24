//
//  ViewController.swift
//  Activities
//
//  Created by Ahmed Eldably on 2/22/19.
//  Copyright © 2019 CODE. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var recievedID = String()


    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   
        
    }
    override func viewDidAppear(_ animated: Bool)
    {
        self.performSegue(withIdentifier: "loginView", sender: self)
    }

}

