//
//  civilWork.swift
//  Activities
//
//  Created by Ahmed Eldably on 2/23/19.
//  Copyright © 2019 CODE. All rights reserved.
//

import Foundation
import UIKit

//
//  homePageVC.swift
//  Activities
//
//  Created by Ahmed Eldably on 2/22/19.
//  Copyright © 2019 CODE. All rights reserved.
//

class activityVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{
    @IBOutlet weak var collectionViewName: UICollectionView!
    
    var RecieviedID = String()

    
    var actArray = [activityModel]()
    //  Declaring an array for every item
    var Science = [["1", "Planetarium Science Center", "psc@bibalex.org", "The Planetarium Science Center (PSC) is an ideal place to enjoy a day of fun learning. It is an independent non-profit educational foundation dedicated to increasing the public's awareness, interest, and understanding of science and technology through entertainment.", "12-16", #imageLiteral(resourceName: "Sherif"), #imageLiteral(resourceName: "PSC")], ["1", "Nexus", "info@nexus.org", "Preparing a generation of science communicators who could deliver science to the public and non professionals easily.", "12-16", #imageLiteral(resourceName: "nexus act"), #imageLiteral(resourceName: "Nexus 1")]]
    
    var Sport = [["1", "Alex Marathon",  "info@alexmarathon.org", "Alex Marathon is a non-profitable organization established in 2010 Organized by some enthusiastic young volunteers. It's the first running event held in Alexandria aiming to spread the awareness of sports in our society. It has been held on Friday of every week attracting lots of amateur and professional runners in their different age stages. ", "6-60+", #imageLiteral(resourceName: "Alexa Marathon Sample"), #imageLiteral(resourceName: "Alex Marathon")], ["2", "Cairo Runners", "info@cairorunners.con", "Cairos first running troupe. We embrace the importance of a healthier, happier Cairo. Changing Cairo one step at a time.", "12-16", #imageLiteral(resourceName: "Cairo Runners Sample"), #imageLiteral(resourceName: "Cairo Runners")]]
    
    var Language = [["1", "English", "psc@bibalex.org", "Description: ", "12-16", #imageLiteral(resourceName: "Civil Work"), #imageLiteral(resourceName: "Shift")], ["2", "planetarium science center", "psc@bibalex.org", "Description: ", "12-16", #imageLiteral(resourceName: "Civil Work"), #imageLiteral(resourceName: "PSC")]]
    
    var civilWork = [["1", "BTG", "info@btg.org", "The project aims that youth we help guide them to become better members of society by increasing their skills & develop their abilities.", "12-16", #imageLiteral(resourceName: "BTG"), #imageLiteral(resourceName: "BTG")], ["2", "planetarium science center", "psc@bibalex.org", "Description: ", "12-16", #imageLiteral(resourceName: "Sherif"), #imageLiteral(resourceName: "Shift-1")]]
    
    var Art = [["1", "planetarium science center", "psc@bibalex.org", "Description: ", "12-16", #imageLiteral(resourceName: "Sherif"), #imageLiteral(resourceName: "PSC")], ["2", "planetarium science center", "psc@bibalex.org", "Description: ", "12-16", #imageLiteral(resourceName: "Sherif"), #imageLiteral(resourceName: "PSC")]]
    
    var Concerts = [["1", "planetarium science center", "psc@bibalex.org", "Description: ", "12-16", #imageLiteral(resourceName: "Sherif"), #imageLiteral(resourceName: "PSC")], ["1", "planetarium science center", "psc@bibalex.org", "Description: ", "12-16", #imageLiteral(resourceName: "Sherif"), #imageLiteral(resourceName: "PSC")]]

    var arr = [["1", "Shift", #imageLiteral(resourceName: "Shift")], ["2", "AVAD", #imageLiteral(resourceName: "Science")]]
    
    override func viewDidLoad()
    {
//    Outputing based on the index
        super.viewDidLoad()
        collectionViewName.delegate = self
        collectionViewName.dataSource = self
        RecieviedID = UserDefaults.standard.string(forKey: "catID")!
        if RecieviedID == "1"
        {
            arr = Science
        }
        else if RecieviedID == "2"
        {
            arr =  Sport
        }
        else if RecieviedID == "3"
        {
            arr = Language
        }
        else if RecieviedID == "4"
        {
            arr = civilWork
        }
        else if RecieviedID == "5"
        {
            arr = Art
        }
        else if RecieviedID == "6"
        {
             arr =  Concerts
        }
        
        for item in arr
        {
            let activityID = item[0] as! String
            let activityName = item[1] as! String
            let actContact = item[2] as! String
            let actDescr = item[3] as! String
            let actAge = item[4] as! String
            let activityImage = item[5] as! UIImage
            let activityLogo =  item[6] as! UIImage

            
            let act = activityModel(actID: activityID, actName: activityName, actContact: actContact, actDescr: actDescr, actAge: actAge, actImage: activityImage, actLogo: activityLogo)
            
            self.actArray.append(act)
        }
        collectionViewName.reloadData()
        
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return civilWork.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewName.dequeueReusableCell(withReuseIdentifier: "categoriesCell", for: indexPath) as! mainCollectionViewCell
        
        let data: activityModel
        data = actArray[indexPath.row]
        cell.imageCategory.image = data.actLogo
        cell.categoryName.text = data.actName
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
//       Open the element chosen
        let data: activityModel
        data = actArray[indexPath.row]
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController =  storyBoard.instantiateViewController(withIdentifier: "elementVC") as! elementVC
        viewController.activityID = data.actID!
        viewController.activityName = data.actName!
        viewController.actContact = data.actContact!
        viewController.actDescr = data.actDescr!
        viewController.actAge = data.actAge!
        viewController.activityImage = data.actImage!
        
        
        self.present(viewController, animated: true, completion: nil)
    }
}

