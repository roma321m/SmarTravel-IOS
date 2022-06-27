import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {

    @IBOutlet weak var tripsTableView: UITableView!
    
    var userEmail: String = ""
    var trips: [Trip] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = userEmail //FIXME: firebase user email
        initTableView()
    }
    
    private func initTableView() {
        tripsTableView.delegate = self
        tripsTableView.dataSource = self
        
        registerCells()
    }
    
    private func registerCells() {
        tripsTableView.register(UINib(nibName: TripListTableViewCell.identifier, bundle: nil),
                                forCellReuseIdentifier: TripListTableViewCell.identifier)
    }

}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trips.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TripListTableViewCell.identifier, for: indexPath) as! TripListTableViewCell
        cell.setup(trip: trips[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = TripDetailViewController.instantiate()
        controller.trip = trips[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
