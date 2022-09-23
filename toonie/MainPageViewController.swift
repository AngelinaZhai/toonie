//
//  MainPageViewController.swift
//  toonie
//
//  Created by Angelina Zhai on 2022-09-23.
//

import UIKit
import FirebaseAuth

class MainPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logOutTapped(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        }
        catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
            return
        }
        print("Successfully logged out")
        //back to login page
        toLogIn()
    }
    
    func toLogIn(){
        let storyboard = UIStoryboard(name: "Main", bundle:nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "login")
        print("back to home")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
