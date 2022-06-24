import UIKit

class TripDetailViewController: UIViewController {

    @IBOutlet weak var tripImageView: UIImageView!
    @IBOutlet weak var tripTitleLable: UILabel!
    @IBOutlet weak var tripPriceLable: UILabel!
    @IBOutlet weak var tripDescriptionLable: UILabel!
    
    var trip: Trip!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateView()
    }
    
    private func populateView() {
        tripImageView.kf.setImage(with: trip.image?.asUrl)
        tripTitleLable.text = trip.name
        tripPriceLable.text = trip.formattedPrice
        tripDescriptionLable.text = trip.description
    }
    
    @IBAction func PlaceOrderClicked(_ sender: Any) {
        
    }
    
}
