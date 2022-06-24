import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: PopularCollectionViewCell.self)

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var tripImageView: UIImageView!
    @IBOutlet weak var priceLable: UILabel!
    @IBOutlet weak var descriptionLable: UILabel!
    
    func setup(_ trip: Trip) {
        titleLable.text = trip.name
        tripImageView.kf.setImage(with: trip.image?.asUrl)
        priceLable.text = trip.formattedPrice
        descriptionLable.text = trip.description
    }

}
