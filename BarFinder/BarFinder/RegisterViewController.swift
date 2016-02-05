//
//  RegisterViewController.swift
//  BarFinder
//
//  Created by Kaloian on 2/4/16.
//  Copyright © 2016 Kaloian. All rights reserved.
//

import UIKit
import Parse

class RegisterViewController: UIViewController {


    @IBOutlet weak var usernameTextInput: UITextField!
    @IBOutlet weak var emailTextInput: UITextField!
    @IBOutlet weak var passwordTextInput: UITextField!
    @IBOutlet weak var repeatPasswordTextInput: UITextField!
    
    @IBAction func registerButtonTapped(sender: AnyObject) {
        let errorTitle = "Грешка!";
        let succsessTitle = "Успех!";
        let usernameErrorMessage = "Липсва име!";
        let emailErrorMessage = "Невалидна поща!";
        let passwordErrorMessage = "Липсва парола от поне 3 символа!";
        let passwordsDontMatchMessage = "Паролите не съвпадат!";
        let successMessage = "Регистрацията е успешна!";
        
        let username = usernameTextInput.text;
        let userEmail = emailTextInput.text;
        let userPassword = passwordTextInput.text;
        let userRepeatPassword = repeatPasswordTextInput.text;
        
        if username?.isEmpty == true
        {
            displayAlertMessage(errorTitle, message: usernameErrorMessage);
            return;
        }
        
        if userEmail?.isEmpty == true
        {
            displayAlertMessage(errorTitle, message: emailErrorMessage);
            return;
        }
        
        if userPassword?.isEmpty == true || userRepeatPassword?.isEmpty == true || userPassword?.characters.count<3
        {
            displayAlertMessage(errorTitle, message: passwordErrorMessage);
            return;
        }
       
        if(userPassword != userRepeatPassword)
        {
            displayAlertMessage(errorTitle, message: passwordsDontMatchMessage);
            return;
        }
        
        
        let user = PFUser()
        user.username = username;
        user.email = userEmail;
        user.password = userPassword;
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo["error"] as? String
                self.displayAlertMessage(errorTitle, message:errorString!);
            } else {
                self.displayAlertMessage(succsessTitle, message: successMessage);
            }
        }
        
        
        
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
