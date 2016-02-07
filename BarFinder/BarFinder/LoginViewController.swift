//
//  LoginViewController.swift
//  BarFinder
//
//  Created by Kaloian on 2/4/16.
//  Copyright © 2016 Kaloian. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    let successTitle = "Успех!";
    let errorTitle = "Грешка!";
    let confirmTitle = "OK";
    let successLoginMessage = "Успешен логин!";
    let successLogoutMessage = "Успешно отписване!";
    let errorLoginMessage = "Неуспешен логин!";

    @IBOutlet weak var usernameTextInput: UITextField!
    
    @IBOutlet weak var inputFieldPassword: UITextField!
    
    @IBAction func LoginButtonTapped(sender: AnyObject) {
        
        
        let username = usernameTextInput.text;
        let userPassword = inputFieldPassword.text;
        
        PFUser.logInWithUsernameInBackground(username!, password:userPassword!) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                self.displayAlertMessage(self.successTitle, message: self.successLoginMessage);
            } else {
                self.displayAlertMessage(self.errorTitle, message: self.errorLoginMessage);

            }
        }
    }
    
    @IBAction func LogOutButtonTapped(sender: AnyObject) {
        PFUser.logOut();
        self.displayAlertMessage(self.successTitle, message: self.successLogoutMessage);
    }
    
    func displayAlertMessage (title: String, message: String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert);
        let okAction = UIAlertAction(title: self.confirmTitle, style: UIAlertActionStyle.Cancel, handler:nil);
        alert.addAction(okAction);
        
        self.presentViewController(alert, animated: true, completion: nil);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
