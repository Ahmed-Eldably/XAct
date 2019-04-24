//
//  registerViewController.swift
//  Activities
//
//  Created by Ahmed Eldably on 2/22/19.
//  Copyright © 2019 CODE. All rights reserved.
//

import UIKit

class registerViewController: UIViewController
{
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func signUpAction(_ sender: Any)
    {
//        Return false if empty
        guard let email = userEmailTextField.text else {return}
        guard let password = userPasswordTextField.text else {return}
        let confirm = confirmPasswordTextField.text
//        checling if password and match password are matched
        if password == confirm
        {
            UserDefaults.standard.set(password, forKey: email)
            diplaySuccessMessage(Message: "Welcome")
            print("sucess")
            // when okay clicked go to log in
        }
        else
        {
            displayAllertMessage(userMessage: "Passwords don't match")
            print("Password didn't match")
        }
    }
    
    func displayAllertMessage(userMessage: String)
    {
//        Display an alert message if password and match password do not match
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "Retry", style: UIAlertAction.Style.default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
    }
    
    func diplaySuccessMessage(Message: String)
    {
//        Display a success message if both passwrod and confirm password are matched
        let myAlert = UIAlertController(title: "Success", message: Message, preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {(_ action: UIAlertAction) -> Void in
            self.goLogin()
        })
        
        myAlert.addAction(okAction)

        self.present(myAlert, animated: true, completion: nil)
    }
    func goLogin()
    {
//        Go to Login Page
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController =  storyBoard.instantiateViewController(withIdentifier: "login")
        self.present(viewController, animated: true, completion: nil)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
