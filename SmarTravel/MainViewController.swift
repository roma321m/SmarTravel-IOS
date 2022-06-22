import UIKit

class MainViewController: UIViewController {
    
    //MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Trips"
        
        navigationController?.navigationBar.tintColor = UIColor(named: "secondaryColor")
        
        configureItems()
    }
    
    //MARK: - View methods

    private func configureItems() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .search,
            target: self,
            action: #selector(searchTrip))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "gear"),
            style: .done,
            target: self,
            action: #selector(settings))
    }
    
    @objc func searchTrip() {
        // TODO: add search option
    }
    
    @objc func settings() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let settingsVC = mainStoryboard.instantiateViewController(withIdentifier: "settings_vc") as? SettingsViewController {
            navigationController?.pushViewController(settingsVC, animated: true)
        }
    }
}
