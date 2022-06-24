import UIKit

extension UIView {
    
    // This adds the option to add radius to view elements with the inspecter
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
