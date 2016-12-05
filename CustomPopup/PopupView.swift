import UIKit

class PopupView: UIView {

    @IBOutlet weak var baseView:UIView!
    
    @IBAction func close(_ sender:UIButton) {
        self.removeFromSuperview()
        
    }

}
