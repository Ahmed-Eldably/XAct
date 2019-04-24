//
//  categoriesClass.swift
//  Activities
//
//  Created by Ahmed Eldably on 2/23/19.
//  Copyright © 2019 CODE. All rights reserved.
//

import Foundation
import UIKit

//Categories Class
class categoriesModel
{
    var catID: String?
    var catName: String?
    var catImage: UIImage?
    
    init(catId: String?, catName: String?, catImage: UIImage?)
    {
        self.catID = catId
        self.catName = catName
        self.catImage = catImage
    }
}
