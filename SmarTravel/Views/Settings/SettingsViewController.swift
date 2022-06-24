import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController {
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        
        navigationController?.navigationBar.tintColor = UIColor(named: "secondaryColor")
        
        configureItems()
    }
    
    //MARK: - View methods

    private func configureItems() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Sign Out",
            style: .done,
            target: self,
            action: #selector(signOut))
    }

    @objc func signOut() {
        
        do {
            try FirebaseAuth.Auth.auth().signOut()
            let controller = LoginViewController.instantiate()
            self.present(controller, animated: true, completion: nil)
        }
        catch {
            print("An error occurred when logging out")
        }
        
    }
}
