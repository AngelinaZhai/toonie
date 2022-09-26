//
//  MainPageViewController.swift
//  toonie
//
//  Created by Angelina Zhai on 2022-09-23.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

//let ref = Database.database().reference()

class MainPageViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    var ref:DatabaseReference!
    var total:Int! = 0
    var safeEmail:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()

        let userEmail = Auth.auth().currentUser?.email
        self.safeEmail = userEmail!.replacingOccurrences(of: ".", with: "!")
        self.safeEmail = safeEmail.replacingOccurrences(of: "@", with: "!")
        
//        getTotalFromDB()
        
        self.ref.child(self.safeEmail).observe(.value, with: {(snapshot) in
                                                          if let dictionary = snapshot.value as? [String:Int]{
            self.total = dictionary["total"]
            
                                                          }})
        
        displayTotal()
        

        
        // Do any additional setup after loading the view.
//        let ref = Database.database().reference()
//        ref.child("someid/name").setValue()
    }
    
    func getTotalFromDB(){
        
        self.ref.child(self.safeEmail).observe(.value, with: {(snapshot) in
                                                          if let dictionary = snapshot.value as? [String:Int]{
            self.total = dictionary["total"]!
            
                                                          }})
//        self.total = dictionary["total"]!
    }
    
    @IBAction func addToonie(_ sender: Any) {
        let newTotal = self.total + 2
        //send new total to firebase
        let directory = self.safeEmail+"/total"
        self.ref.child(directory).setValue(newTotal)
//        ref.child(userEmail+"/value").setValue(newTotal)
//        self.totalLabel.text="Total: $" + String(newTotal)
        self.total = newTotal
        displayTotal()
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
    
    func displayTotal(){
        self.totalLabel.text = String(format: "%d", self.total)
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
