//
//  loginViewController.swift
//  Activities
//
//  Created by Ahmed Eldably on 2/22/19.
//  Copyright © 2019 CODE. All rights reserved.
//

import UIKit

class loginViewController: UIViewController
{
//    Email Text
    @IBOutlet weak var emailTF: UITextField!
    
//    Password Text Encrypted
    @IBOutlet weak var passwordTF: UITextField!
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginAction(_ sender: Any)
    {
//        if blank return error
        guard let email = emailTF.text else {return}
        guard let passwrod = passwordTF.text else {return}
        
//        User default. The email is the key
        if let pass = UserDefaults.standard.string(forKey: email)
        {
            if passwrod == pass
            {
                print("login")
                diplaySuccessMessage(Message: "Hello")
                UserDefaults.standard.set(true, forKey: "isLoggedIn")
                
            }
            else
            {
                displayAllertMessage(userMessage: "Wrong Password")
                print("wrong password")
                
            }
        }
        else
        {
            displayAllertMessage(userMessage: "Wrong Email")
            print("Wrong email")
        }
    }
    
    func displayAllertMessage(userMessage: String)
    {
        //        Display an Alert message if password or email is wrong
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "Retry", style: UIAlertAction.Style.default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
    }
    
    func diplaySuccessMessage(Message: String)
    {
//        Display a success message if both email and password are matched
        let myAlert = UIAlertController(title: "Success", message: Message, preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {(_ action: UIAlertAction) -> Void in
            self.goHome()
        })
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
    }
    func goHome()
    {
//        Go to homepage after Log In
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController =  storyBoard.instantiateViewController(withIdentifier: "homePage")
        self.present(viewController, animated: true, completion: nil)
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
