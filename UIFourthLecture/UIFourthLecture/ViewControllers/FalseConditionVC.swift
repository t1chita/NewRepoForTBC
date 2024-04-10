//
//  FalseCondition.swift
//  UIFourthLecture
//
//  Created by Temur Chitashvili on 10.04.24.
//

import UIKit

class FalseConditionVC: UIViewController {
    let backgroundImage: UIImageView = {
        var image = UIImageView(image: .background)
        return image
    }()
    let falseLabel: UILabel = {
       let label = UILabel()
        label.text = "🚨თქვენს მიერ შეყვანილი ინფორმაცია არასწორია,გთხოვთ ცადოთ თავიდან!🚨"
        label.textAlignment = .center
        label.textColor = .redButton
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .viewBackground
        addBackgroundImage()
        addFalseLabel()
    }
    func addBackgroundImage() {
        view.addSubview(backgroundImage)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backgroundImage.widthAnchor.constraint(equalTo: view.widthAnchor),
            backgroundImage.heightAnchor.constraint(equalTo: view.heightAnchor),
        ])
    }
    func addFalseLabel() {
        view.addSubview(falseLabel)
        falseLabel.translatesAutoresizingMaskIntoConstraints = false
        falseLabel.frame = CGRect(x: 0, y: 0, width: 335, height: 300)
        NSLayoutConstraint.activate([
            falseLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            falseLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            falseLabel.widthAnchor.constraint(equalToConstant: 335),
            falseLabel.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}
