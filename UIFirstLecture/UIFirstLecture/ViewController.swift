//
//  ViewController.swift
//  UIFirstLecture
//
//  Created by Temur Chitashvili on 03.04.24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelOfLMCAndHCF: UILabel!
    @IBOutlet weak var switchForLabel: UISwitch!
    @IBOutlet weak var firstNumberTextLabel: UITextField!
    @IBOutlet weak var secondNumberTextLabel: UITextField!
    @IBOutlet weak var computeButton: UIButton!
    @IBOutlet weak var answerLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelOfLMCAndHCF.text = "უმცირესი საერთო ჯერადი"
        firstNumberTextLabel.placeholder = "შეიყვანეთ მნიშვნელობა"
        secondNumberTextLabel.placeholder = "შეიყვანეთ მნიშვნელობა"
        computeButton.setTitle("გამოთვლა", for: .normal)
        computeButton.tintColor = UIColor.blue
        answerLable.text = "პასუხი:"
       
    }
    
    
    @IBAction func computeLMCOrHCF(_ sender: Any) {
        var intOfFirstText = 0
        var intOfSecondText = 0
        if let unwrappedFirstNumber = firstNumberTextLabel.text {
            intOfFirstText = Int(unwrappedFirstNumber) ?? 0
            if intOfFirstText == 0 {
                firstNumberTextLabel.textColor = UIColor.red
                return
            }
        }
        if let unwrappedSecondNumber =
            secondNumberTextLabel.text {
             intOfSecondText =
            Int(unwrappedSecondNumber) ?? 0
            if intOfSecondText == 0 {
                secondNumberTextLabel.textColor = UIColor.red
                return
            }

        }
        if switchForLabel.isOn {
            var answer: Int = 0
            let maxNum = max(intOfFirstText, intOfSecondText)
            for num in stride(from: maxNum, to: 0, by: -1) {
                if  intOfFirstText % Int(num) == 0 &&  intOfSecondText % Int(num) == 0 {
                    firstNumberTextLabel.textColor = UIColor.gray
                    secondNumberTextLabel.textColor = UIColor.gray
                    answer = Int(num)
                    break
                }
            }
            answerLable.text = "პასუხი: \(answer)"
        }else {
            var answer: Int = 0
            for num in 1...Int16.max{
                if Int(num) % intOfFirstText == 0 && Int(num) % intOfSecondText == 0 {
                    firstNumberTextLabel.textColor = UIColor.gray
                    secondNumberTextLabel.textColor = UIColor.gray
                    answer = Int(num)
                    break
                }
            }
            answerLable.text = "პასუხი: \(answer)"
        }
    }
    
    @IBAction func changeLabelLMCToHCF(_ sender: Any) {
        if switchForLabel.isOn {
            labelOfLMCAndHCF.text = "უდიდესი საერთო გამყოფი"
            computeButton.tintColor = UIColor.red
        }else {
            labelOfLMCAndHCF.text = "უმცირესი საერთო ჯერადი"
            computeButton.tintColor = UIColor.blue
        }
    }
}

