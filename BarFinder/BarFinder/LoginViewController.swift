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



    @IBOutlet weak var usernameTextInput: UITextField!
    
    @IBOutlet weak var inputFieldPassword: UITextField!
    
    @IBAction func LoginButtonTapped(sender: AnyObject) {
        
        
        let username = usernameTextInput.text;
        let userPassword = inputFieldPassword.text;
        
        PFUser.logInWithUsernameInBackground(username!, password:userPassword!) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                self.displayAlertMessage("Успех!", message: "Успешен логин!");
            } else {
                self.displayAlertMessage("Грешка!", message: "Неуспешен логин!");

            }
        }
    }
    
    @IBAction func LogOutButtonTapped(sender: AnyObject) {
        PFUser.logOut();
        self.displayAlertMessage("Успех!", message: "Успешно отписване!");
    }
    
    func displayAlertMessage (title: String, message: String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert);
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler:nil);
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
