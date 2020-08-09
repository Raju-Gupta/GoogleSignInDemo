//
//  ViewController2.swift
//  GoogleSignInDemo
//
//  Created by Raju Gupta on 18/12/19.
//  Copyright © 2019 Raju Gupta. All rights reserved.
//

import UIKit
import SDWebImage
import GoogleSignIn

class ViewController2: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblUserId: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblTokenId: UILabel!
    @IBOutlet weak var btnLogout: UIButton!
    
    var userdata : UserData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let user = userdata
        {
            lblName.text = user.name
            lblEmail.text = user.email
            lblUserId.text = user.userId
            lblTokenId.text = user.userToken
            imgProfile.sd_setImage(with: user.userProfile, completed: nil)
            //print("userId === \(user.userId ?? "") token ===\(user.userToken ?? "")")
        }
        else
        {
            print("userdata not found")
        }
    }
    

    @IBAction func onClickLogout(_ sender: Any)
    {
        GIDSignIn.sharedInstance()?.signOut()
        navigationController?.popViewController(animated: true)
    }
    
}
