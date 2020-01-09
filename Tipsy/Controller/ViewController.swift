import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButtom: UIButton!
    @IBOutlet weak var tenPctButtom: UIButton!
    @IBOutlet weak var twentyPctButtom: UIButton!
    @IBOutlet weak var spletNumberLabel: UILabel!
    
    var tipValue = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var result = ""
    var advice = "Some Text..."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        unselelct()
        billTextField.endEditing(true)
        switch sender {
        case zeroPctButtom:
            zeroPctButtom.isSelected = true
            tipValue = 0
            
        case tenPctButtom:
            tenPctButtom.isSelected = true
            tipValue = 0.1
            
        case twentyPctButtom:
            twentyPctButtom.isSelected = true
            tipValue = 0.2
            
        default:
            print("Error")
        }
    }

    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        billTextField.endEditing(true)
        spletNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    
    
    @IBAction func buttomPresser(_ sender: UIButton) {
        let bill = billTextField.text!
        
        //If the text is not an empty String ""
        if bill != "" {
            billTotal = Double(bill)!
            let result = billTotal * (1 + tipValue) / Double(numberOfPeople)
            
            //Round the result to 2 decimal places and turn it into a String.
            let resultTo2DecimalPlaces = String(format: "%.2f", result)
            self.result = resultTo2DecimalPlaces
            performSegue(withIdentifier: "goToResult", sender: self)
        }
        
    }
    
    func unselelct(){
        zeroPctButtom.isSelected = false
        tenPctButtom.isSelected = false
        twentyPctButtom.isSelected = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = result
            destinationVC.advice = advice
        }
    }
}

