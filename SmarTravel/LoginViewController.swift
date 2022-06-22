import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    // MARK: - UI element diclaration
    
    @IBOutlet weak var login_TF_email: UITextField!
    @IBOutlet weak var login_TF_password: UITextField!
    @IBOutlet weak var login_BTN_continue: UIButton!
    
    var login_Alert_newAccount: UIAlertController!
    
    // MARK: - global variables diclaration
    
    var loginEmail:String!
    var loginPassword:String!
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // SetupView
        setupView()
    }
    
    //MARK: - View methods
    
    private func setupView(){
        login_Alert_newAccount = UIAlertController(title: "Create Account",
                                                   message: "Would you like to create an account",
                                                   preferredStyle: .alert)
        login_Alert_newAccount.addAction(UIAlertAction(title: "Continue",
                                      style: .default,
                                      handler: {_ in
        
            FirebaseAuth.Auth.auth().createUser(withEmail: self.loginEmail,
                                                password: self.loginPassword,
                                                completion: { result, error in
                guard error == nil else {
                    // TODO: show the error
                    print("account creation failed")
                    return
                }
                
                self.logIn()
            })
        }))
        
        login_Alert_newAccount.addAction(UIAlertAction(title: "Cancel",
                                      style: .cancel,
                                      handler: {_ in
            
        }))
    }

    @IBAction func continueClicked(_ sender: Any) {
        if let email = checkEmailField() {
            self.loginEmail = email
            if let password = checkPasswordField() {
                self.loginPassword = password
                FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: { result, error in
                    
                    guard error == nil else {
                        self.showCreateAccount()
                        return
                    }
                    
                    self.logIn()
                })
            }
        }
    }
    
    // MARK: - Methods
    
    func logIn() {
        print("You have signed in")
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let mainVC = mainStoryboard.instantiateViewController(withIdentifier: "main_vc") as! UINavigationController
        self.present(mainVC, animated: false, completion: nil)
    }
    
    func showCreateAccount() {
        print("Create new account")
        present(login_Alert_newAccount, animated: true)
    }
    
    func checkEmailField() -> String? {
        if let email = login_TF_email.text {
            if !email.isEmpty {
                print("check email format") // TODO: check email format
                return email
            } else {
                print("Missing email") // TODO: email filed is empty
            }
        } else {
            print("Missing email") // TODO: email errors
        }
        return nil
    }
    
    func checkPasswordField() -> String? {
        if let password = login_TF_password.text {
            if !password.isEmpty {
                print("check password format") // TODO: check password format
                return password
            } else {
                print("Missing password") // TODO: password filed is empty
            }
        } else {
            print("Missing password") // TODO: password errors
        }
        return nil
    }
    
}

