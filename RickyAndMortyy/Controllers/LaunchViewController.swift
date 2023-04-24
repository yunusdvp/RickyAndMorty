//
//  LaunchViewController.swift
//  collecdeneme
//
//  Created by Yunus Emre ÖZŞAHİN on 13.04.2023.
//

import UIKit

class LaunchViewController: UIViewController {
    
    @IBOutlet weak var launchMessageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        if UserDefaults.standard.bool(forKey: "welcomeMessageDisplayed") {
            launchMessageLabel.text = "Hello!"
        } else {
            launchMessageLabel.text = "Welcome!"
            
            // Mark welcome message as displayed
            UserDefaults.standard.set(true, forKey: "welcomeMessageDisplayed")
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.performSegue(withIdentifier: "LaunchSegue", sender: nil)
        }
    }
}
        // Do any additional setup after loading the
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


