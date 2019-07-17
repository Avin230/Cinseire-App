//
//  ViewController.swift
//  safeApp
//
//  Created by HGPMAC77 on 6/25/19.
//  Copyright © 2019 HGPMAC77. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var actionButton: UIButton!
    @IBAction func action(_ sender: UIButton)
    {
        if (emailText.text != "" && passwordText.text != "") {

            if self.segmentControl.selectedSegmentIndex == 0 //Login
            {
                Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!, completion: { ( user, error) in
                        if user != nil
                        {
                            //sign in successful
                            self.performSegue(withIdentifier:  "segue", sender: self)
                        }
                        else
                        {
                            if let myError = error?.localizedDescription
                            {
                                print(myError)
                            }
                            else
                            {
                                print("ERROR")
                            }
                        }
                })
            }
            else //signup user
            {
                Auth.auth().createUser( withEmail: emailText.text!, password: passwordText.text!, completion: { ( user, error) in
                    if user != nil
                    {
                        self.performSegue(withIdentifier:  "segue", sender: self)
                    }
                    else
                    {
                        if let myError = error?.localizedDescription
                        {
                            print(myError)
                        }
                        else
                        {
                            print("ERROR")
                        }
                    }
                })
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

