//
//  SignupViewController.swift
//  toonie
//
//  Created by Angelina Zhai on 2022-09-23.
//

import UIKit
import FirebaseAuth
import FirebaseCore

class SignupViewController: UIViewController {

    @IBOutlet var email: UITextField!
    @IBOutlet var pw: UITextField!
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        if email.text?.isEmpty == true {
            print("No text entered for email")
            //alert add here
            return
        }
        
        if pw.text?.isEmpty == true {
            print("No text entered for password")
            //alert add here
            return
        }
        signup()
    }
    
    
    @IBAction func loginTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle:nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "login")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    func signup(){
        Auth.auth().createUser(withEmail: email.text!, password: pw.text!){
            (authResult, error) in
            guard let user = authResult?.user, error == nil else {
                print("Error \(error?.localizedDescription)")
                return
            }
           
            //if passed authentication check
            let storyboard = UIStoryboard(name: "Main", bundle:nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "mainHome")
            print("Passed Authentication")
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true)
            
        }
    }
}
