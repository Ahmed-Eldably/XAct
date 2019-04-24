////
////  activityModel.swift
////  Activities
////
////  Created by Ahmed Eldably on 2/23/19.
////  Copyright © 2019 CODE. All rights reserved.
////
//
import Foundation
import UIKit

//Activity Class
class activityModel
{
    var actID: String?
    var actName: String?
    var actContact: String?
    var actDescr: String?
    var actAge: String?
    var actImage: UIImage?
    var actLogo: UIImage?


    init(actID: String?, actName: String?, actContact: String, actDescr: String?, actAge: String?, actImage: UIImage?,actLogo: UIImage?)
    {
        self.actID = actID
        self.actName = actName
        self.actImage = actImage
        self.actContact = actContact
        self.actDescr = actDescr
        self.actAge = actAge
        self.actLogo = actLogo
    }
}
