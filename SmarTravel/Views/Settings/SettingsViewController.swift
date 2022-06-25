import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var signOutButtom: UIBarButtonItem!
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
    }
    
    //MARK: - View methods
    
    @IBAction func signOutClicked(_ sender: Any) {
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
