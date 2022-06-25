import UIKit

class TripListTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: TripListTableViewCell.self)
    
    @IBOutlet weak var tripImageView: UIImageView!
    @IBOutlet weak var tripTitleLable: UILabel!
    @IBOutlet weak var tripDEscriptionLable: UILabel!
    
    func setup(trip: Trip) {
        tripImageView.kf.setImage(with: trip.image?.asUrl)
        tripTitleLable.text = trip.name
        tripDEscriptionLable.text = trip.description
    }
}
