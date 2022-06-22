import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    // MARK: - global static variables diclaration
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    // MARK: - UI element diclaration
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLable: UILabel!
    @IBOutlet weak var slideDescriptionLable: UILabel!
    
    // MARK: - methods
    
    func setup(_ slide: OnBoardingSlide){
        slideImageView.image = slide.image
        slideTitleLable.text = slide.title
        slideDescriptionLable.text = slide.description
    }
}
