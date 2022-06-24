import UIKit

class TripDetailViewController: UIViewController {

    @IBOutlet weak var tripImageView: UIImageView!
    
    @IBOutlet weak var tripTitleLable: UILabel!
    
    @IBOutlet weak var tripPriceLable: UILabel!
    
    @IBOutlet weak var tripDescriptionLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func PlaceOrderClicked(_ sender: Any) {
        
    }
    
}
