//
//  elementVC.swift
//  Activities
//
//  Created by Ahmed Eldably on 2/28/19.
//  Copyright © 2019 CODE. All rights reserved.
//

import UIKit

class elementVC: UIViewController
{
    
    @IBOutlet weak var elementImage: UIImageView!
    @IBOutlet weak var elementTitle: UILabel!
    @IBOutlet weak var elementDescr: UITextView!
    @IBOutlet weak var elementAge: UILabel!
    @IBOutlet weak var elementEmail: UILabel!
    
    var activityID = String()
    var activityName = String()
    var actContact = String()
    var actDescr = String()
    var actAge = String()
    var activityImage = UIImage()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        elementImage.image = activityImage
        elementTitle.text = activityName
        elementAge.text = actAge
        elementEmail.text = actContact
        elementDescr.text = actDescr
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
