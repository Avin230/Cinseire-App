//
//  ViewController2.swift
//  safeApp
//
//  Created by HGPMAC77 on 7/8/19.
//  Copyright © 2019 HGPMAC77. All rights reserved.
//

import UIKit
import FirebaseAuth
class ViewController2: UIViewController {
    
    @IBAction func action(_ sender: UIButton)
    {
        try! Auth.auth().signOut()
        performSegue(withIdentifier: "segue2", sender: self )
        print(Auth.auth().currentUser?.email)
    }
    

}
