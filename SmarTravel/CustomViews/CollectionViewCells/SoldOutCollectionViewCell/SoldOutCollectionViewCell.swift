import UIKit

class SoldOutCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: SoldOutCollectionViewCell.self)
    
    @IBOutlet weak var tripImageView: UIImageView!
    @IBOutlet weak var tripTitle: UILabel!
    @IBOutlet weak var tripDescription: UILabel!
    
    func setup(_ trip: Trip){
        tripTitle.text = trip.name
        tripImageView.kf.setImage(with: trip.image?.asUrl)
        tripDescription.text = trip.description
    }

}
