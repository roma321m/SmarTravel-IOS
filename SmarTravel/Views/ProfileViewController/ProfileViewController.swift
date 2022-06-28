import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {

    @IBOutlet weak var tripsTableView: UITableView!
    
    var userEmail: String = ""
    var trips: [Trip] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "My Trips"
        initTableView()
    }
    
    private func initTableView() {
        tripsTableView.delegate = self
        tripsTableView.dataSource = self
        
        setData()
        registerCells()
    }
    
    private func registerCells() {
        tripsTableView.register(UINib(nibName: TripListTableViewCell.identifier, bundle: nil),
                                forCellReuseIdentifier: TripListTableViewCell.identifier)
    }
    
    private func setData() {
        // read trips from defults
        let defaults = UserDefaults.standard
        if let data = defaults.data(forKey: "myTrips") {
            do {
                let decoder = JSONDecoder()
                trips = try decoder.decode([Trip].self, from: data)
            } catch {
                print("Unable to Decode Notes (\(error))")
            }
        }
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
