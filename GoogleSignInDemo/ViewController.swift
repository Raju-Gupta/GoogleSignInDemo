//
//  ViewController.swift
//  GoogleSignInDemo
//
//  Created by Raju Gupta on 18/12/19.
//  Copyright © 2019 Raju Gupta. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController, GIDSignInDelegate{

    @IBOutlet weak var btnGoogle: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }


    @IBAction func onClickGoogle(_ sender: Any)
    {
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.signIn()
    }
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if error != nil
        {
            print(error.localizedDescription)
        }
        else
        {
            if let user = user
            {
                let userProfileData = UserData(name: user.profile.name, email: user.profile.email, userId: user.userID, userToken: user.authentication.idToken, userProfile: user.profile.imageURL(withDimension: UInt(200)))
                let vc = storyboard?.instantiateViewController(identifier: "ViewController2") as! ViewController2
                vc.userdata = userProfileData
                navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}

