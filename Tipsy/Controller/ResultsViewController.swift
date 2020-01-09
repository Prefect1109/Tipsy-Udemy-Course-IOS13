import UIKit

class ResultsViewController: UIViewController {

    var result: String?
    var advice: String?
    
    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = result
        settingsLabel.text = advice
    }
    @IBAction func recalculateButonn(_ sender: UIButton) {
           self.dismiss(animated: true, completion: nil)
    }
}
   

