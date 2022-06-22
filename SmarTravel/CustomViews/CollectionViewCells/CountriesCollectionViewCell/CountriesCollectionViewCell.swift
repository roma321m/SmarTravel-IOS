import UIKit
import Kingfisher

class CountriesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: CountriesCollectionViewCell.self)
    
    @IBOutlet weak var countryImageView: UIImageView!
    @IBOutlet weak var countryTitleLable: UILabel!
    
    func setup(_ country: Country) {
        countryTitleLable.text = country.name
        countryImageView.kf.setImage(with: country.image.asUrl)
    }
    
}
