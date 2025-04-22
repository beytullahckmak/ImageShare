//
//  ViewController.swift
//  ImageShare
//
//  Created by Beytullah Cakmak on 8.04.2025.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var textPassword: UITextField!
    @IBOutlet weak var textEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func register(_ sender: Any) {
        if textEmail.text != nil && textPassword.text != nil{
            //register
            Auth.auth().createUser(withEmail: textEmail.text!, password: textPassword.text!) { (AuthDataResult, Error) in
                if Error != nil {
                    self.hata(baslik: "Hata!", mesaj: Error?.localizedDescription ?? "Kayıt Olunamadı")
                }else{
                    self.performSegue(withIdentifier: "toTabBarController", sender: nil)
                }
                                
            }
        }
        else{
            hata(baslik: "Kayıt Olunamadı!!", mesaj: "E-posta veya şifre boş geçilemez!")
        }
        
    }
    @IBAction func login(_ sender: Any) {
        if textEmail.text != "" && textPassword.text != ""{
            //login
            Auth.auth().signIn(withEmail: textEmail.text!, password: textPassword.text!) { (AuthDataResult,Error) in
                if Error != nil {
                    self.hata(baslik: "Hata!", mesaj: Error?.localizedDescription ?? "Giriş Yapılamadı")
                }
                else {
                    self.performSegue(withIdentifier: "toTabBarController", sender: nil)
                }
            }
        }
        else {
            hata(baslik: "Giriş Yapılamadı!", mesaj: "E-posta veya şifre boş bırakılamaz")
        }
    }
    
    
    func hata (baslik:String,mesaj:String){
        let alert = UIAlertController(title: baslik, message: mesaj, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}

