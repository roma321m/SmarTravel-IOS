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
        // TODO: make new list for my orders and save on the device
    }
    
}
