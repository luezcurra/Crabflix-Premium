//
//  LoginViewController.swift
//  CrabflixPremium
//
//  Created by Luciana Ines Ezcurra on 25/09/2019.
//  Copyright © 2019 Luciana Ines Ezcurra. All rights reserved.
//

import UIKit
import FirebaseUI


class LoginViewController: UIViewController, FUIAuthDelegate {

    
    @IBOutlet weak var logOut: UIButton!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var logIn: UIButton!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var toContinue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Inicializamos Firebase UI y asignamos el delegate
        let authUI = FUIAuth.defaultAuthUI()
        authUI?.delegate = self
        
        // Configurar los providers que vamos a usar
        let providers: [FUIAuthProvider] = [FUIEmailAuth(), FUIGoogleAuth()]
        authUI?.providers = providers

        
    }
    
    @IBAction func logInTap(_ sender: Any) {
        
        if let authUI = FUIAuth.defaultAuthUI() {
            let authViewController = authUI.authViewController()
            present(authViewController, animated: true)
        
    }
 }
     func actualizarPantalla() {
           if let user = Auth.auth().currentUser {
               logIn.isHidden = true
               goButton.isHidden = false
               logOut.isHidden = false
               toContinue.isHidden = true
           } else {
               logIn.isHidden = false
               goButton.isHidden = true
               logOut.isHidden = true
               toContinue.isHidden = false
               }
           }
    
     func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
           actualizarPantalla()
       }
    
    
    @IBAction func go(_ sender: Any) {
        performSegue(withIdentifier: "login-segue", sender: nil)
    }
    
    
    @IBAction func logOut(_ sender: Any) {
        let alert = UIAlertController(title: "LogOut", message: "Do you want to exit from CrabflixPro?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Yes", style: .default, handler: { action in
            let authUI = FUIAuth.defaultAuthUI()
            do {
                try authUI?.signOut()
            } catch {
                print(error)
            }
            self.actualizarPantalla()
    })
         let cancel = UIAlertAction(title: "Cancel", style: .default, handler: { action in
                   
               })
               alert.addAction(cancel)
               alert.addAction(ok)
               DispatchQueue.main.async(execute: {
                   self.present(alert, animated: true)
               })
        
    }

    

}
