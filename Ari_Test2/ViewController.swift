//
//  ViewController.swift
//  Ari_Test2
//
//  Created by Arihant Arora on 6/13/18.
//  Copyright © 2018 Arihant Arora. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    var listOfNumbers = [1,2,3,4,5,6,7,8,9,10]
    var randomNumbers = [Int]()
    
    @IBOutlet weak var randomNumbersLabel: UILabel!
    //Generate random values
    @IBOutlet weak var divisibleNumbersLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func generateNumbers(_ sender: Any) {
        //remove old values
            randomNumbers.removeAll()
        //Generate new values
        var randomNumberString = ""
        for num in stride(from: 1, through: 10, by: 1){
            print(num)
            let random = Int(arc4random_uniform(UInt32(99))) + 1
            randomNumbers.append(random)
            randomNumberString += "\(random), "
        }
        // Update the label with random numbers that we just generated.
        randomNumbersLabel.text = randomNumberString
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //Setting the pickerview values and rows
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listOfNumbers.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(listOfNumbers[row])"
    }
    
    // Check for divisible numbers
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var pickerString = ""
        for i in randomNumbers {
            if i % listOfNumbers[row] == 0 {
                pickerString += "\(i), "
            }
        }
        divisibleNumbersLabel.text = pickerString
    }


}

