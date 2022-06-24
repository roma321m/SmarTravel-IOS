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
            let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            if let loginVC = mainStoryboard.instantiateViewController(withIdentifier: "login_vc") as? LoginViewController {
                self.present(loginVC, animated: true, completion: nil)
            }
        }
        catch {
            print("An error occurred when logging out")
        }
        
    }
}
