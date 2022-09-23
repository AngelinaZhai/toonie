//
//  LoginViewController.swift
//  toonie
//
//  Created by Angelina Zhai on 2022-09-23.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet var email: UITextField!
    @IBOutlet var pw: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginTapped(_ sender: Any) {
        validateFields()
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle:nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "signUp")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    //check if fields have text
    func validateFields(){
        if email.text?.isEmpty == true {
            print("No email text")
            return
        }
        if pw.text?.isEmpty == true {
            print("No password text")
            return
        }
        login()
    }
    
    //login
    func login(){
        Auth.auth().signIn(withEmail: email.text!, password: pw.text!) { [weak self] authResult, err in guard let strongSelf = self else {return}
            guard let user = authResult?.user, err == nil else {
                print("Error \(err?.localizedDescription)")
                return
            }
            self?.checkUserInfo()
        }
    }
    
    
    //check user input
    func checkUserInfo(){
        if Auth.auth().currentUser != nil{
            //if passed authentication check
            let storyboard = UIStoryboard(name: "Main", bundle:nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "mainHome")
            print("Passed Authentication")
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true)
        }
      
    }
    
}
