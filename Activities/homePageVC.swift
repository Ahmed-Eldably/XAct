//
//  homePageVC.swift
//  Activities
//
//  Created by Ahmed Eldably on 2/22/19.
//  Copyright © 2019 CODE. All rights reserved.
//

import UIKit

class homePageVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{
    @IBOutlet weak var collectionViewName: UICollectionView!
    var  catArray = [categoriesModel]()
//    Declaring an array for categories with all the data
    var categories =  [["1", "Science", #imageLiteral(resourceName: "Science")],["2", "Sport", #imageLiteral(resourceName: "sport")],["3", "Language courses", #imageLiteral(resourceName: "languages")],["4", "Civil Work", #imageLiteral(resourceName: "Civil Work")],["4", "Art", #imageLiteral(resourceName: "Art")],["5", "Concerts", #imageLiteral(resourceName: "concerts")]]
    

    override func viewDidLoad()
    {
        super.viewDidLoad()

        collectionViewName.delegate = self
        collectionViewName.dataSource = self
        for category in categories
        {
            let categoryId = category[0] as! String
            let categoryName = category[1] as! String
            let categoryImage = category[2] as! UIImage
            
            let cat = categoriesModel(catId: categoryId, catName: categoryName, catImage: categoryImage)
            
            self.catArray.append(cat)
        }
        collectionViewName.reloadData()
        
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
//        Return the image and the lable Based on the index chosen
        let cell = collectionViewName.dequeueReusableCell(withReuseIdentifier: "categoriesCell", for: indexPath) as! mainCollectionViewCell
        
        let data: categoriesModel
        
        data = catArray[indexPath.row]
        cell.imageCategory.image = data.catImage
        cell.categoryName.text = data.catName
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
//        Go to activities page
        let data: categoriesModel
        
        data = catArray[indexPath.row]
        let ID = data.catID
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let view =  storyBoard.instantiateViewController(withIdentifier: "ActivitesVC") as! activityVC
        UserDefaults.standard.set(ID, forKey: "catID")
        self.present(view, animated: true, completion: nil)
    }

}
