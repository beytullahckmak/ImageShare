//
//  AddViewController.swift
//  ImageShare
//
//  Created by Beytullah Cakmak on 12.04.2025.
//

import UIKit
import FirebaseStorage

class AddViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var textDetails: UITextView!
    @IBOutlet weak var Image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Image.isUserInteractionEnabled = true
        let imageGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(gorselSec))
        Image.addGestureRecognizer(imageGestureRecognizer)
    }
    @objc func gorselSec (){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        Image.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func upload(_ sender: Any) {
        
        let uuidString = UUID().uuidString
        
        let storage = Storage.storage()
        let storageReferance = storage.reference()
        
        let mediaFolder = storageReferance.child("media")
        
        if let data = Image.image?.jpegData(compressionQuality: 0.5){
            let imageReferance = mediaFolder.child("\(uuidString).jpg")
            imageReferance.putData(data, metadata: nil){
            (StorageMetadata,error) in
                if error != nil{
                    print(error?.localizedDescription ?? "HATA")
                }
                else{
                    imageReferance.downloadURL {(Url,error) in
                        if error == nil{
                            let imageUrl = Url?.absoluteString
                            
                            if let imageUrl = imageUrl{ //Opsiyonelliği kaldırdım.
                                print(imageUrl)
                            }
                                
                        }
                    }
                }
            }
            
        }
        
    }
    
    

}
