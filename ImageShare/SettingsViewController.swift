//
//  SettingsViewController.swift
//  ImageShare
//
//  Created by Beytullah Cakmak on 12.04.2025.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
   
    @IBAction func logout(_ sender: Any) {
        
        do{
            try Auth.auth().signOut()
            performSegue(withIdentifier: "toViewController", sender: nil)
        }catch{
            print("Hata")
        }
        
    }
}
