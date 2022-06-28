import UIKit

class TripDetailViewController: UIViewController {

    @IBOutlet weak var tripImageView: UIImageView!
    @IBOutlet weak var tripTitleLable: UILabel!
    @IBOutlet weak var tripPriceLable: UILabel!
    @IBOutlet weak var tripDescriptionLable: UILabel!
    @IBOutlet weak var placeOrderButton: UIButton!
    
    var trip: Trip!
    var showButton = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Trip Details"
        populateView()
        
        if !showButton {
            placeOrderButton.isHidden = true
        } else {
            placeOrderButton.isHidden = false
        }
    }
    
    private func populateView() {
        tripImageView.kf.setImage(with: trip.image?.asUrl)
        tripTitleLable.text = trip.name
        tripPriceLable.text = trip.formattedPrice
        tripDescriptionLable.text = trip.description
    }
    
    @IBAction func PlaceOrderClicked(_ sender: Any) {
        var trips: [Trip] = []
        let defaults = UserDefaults.standard
        // read trips from defults
        if let data = defaults.data(forKey: "myTrips") {
            do {
                let decoder = JSONDecoder()
                trips = try decoder.decode([Trip].self, from: data)
            } catch {
                print("Unable to Decode Notes (\(error))")
            }
        }
        // add new trip to the array
        trips.append(trip)
        // write trips to the defults
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(trips)
            UserDefaults.standard.set(data, forKey: "myTrips")

        } catch {
            print("Unable to Encode Array of trips (\(error))")
        }
        
        let controller = ProfileViewController.instantiate()
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
