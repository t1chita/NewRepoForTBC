//
//  OppositeSignPage.swift
//  UIFourthLecture
//
//  Created by Temur Chitashvili on 10.04.24.
//

import UIKit
protocol ColorChangable {
    func changeBackgroundColor(color: UIColor)
}

class OppositeSignPageVC: UIViewController {
    //MARK: -UI Components-
    let backgroundImage: UIImageView = {
        var image = UIImageView(image: .background)
        return image
    }()
    var zodiacSignImage: UIImageView = {
        let image = UIImageView(image: .iconaquarius)
        return image
    }()
    let zodiacSignNameLabel: UILabel = {
        let label = UILabel()
        label.text = "მერწყული"
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    let redButton: UIButton = {
        let button = UIButton()
        button.setTitle("წითელი", for: .normal)
        button.backgroundColor = .redButton
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 12
        return button
    }()
    let blueButton: UIButton = {
        let button = UIButton()
        button.setTitle("ლურჯი", for: .normal)
        button.backgroundColor = .blueButton
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 12
        return button
    }()
    var delegate: ColorChangable?

    override func viewDidLoad() {
        super.viewDidLoad()
        addBackgroundImage()
        addSignImage()
        addZodiacNameLabel()
        addRedButton()
        addBlueButton()
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
    func addSignImage() {
        view.addSubview(zodiacSignImage)
        zodiacSignImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            zodiacSignImage.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 105),
            zodiacSignImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -105),
            zodiacSignImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 309),
            zodiacSignImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -309)
        ])
    }
    func addZodiacNameLabel() {
        view.addSubview(zodiacSignNameLabel)
        zodiacSignNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            zodiacSignNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            zodiacSignNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            zodiacSignNameLabel.topAnchor.constraint(equalTo: zodiacSignImage.bottomAnchor, constant: -10),
            zodiacSignNameLabel.heightAnchor.constraint(equalToConstant: 34)
        ])
    }
    func addRedButton() {
        view.addSubview(redButton)
        redButton.translatesAutoresizingMaskIntoConstraints = false
        redButton.addTarget(self, action: #selector(tapToRedButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            redButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            redButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            redButton.topAnchor.constraint(equalTo: zodiacSignNameLabel.bottomAnchor, constant: 135),
            redButton.heightAnchor.constraint(equalToConstant: 46)
        ])
    }
    func addBlueButton() {
        view.addSubview(blueButton)
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.addTarget(self, action: #selector(tapToBlueButton), for: .touchUpInside)
        NSLayoutConstraint.activate([
            blueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            blueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            blueButton.topAnchor.constraint(equalTo: redButton.bottomAnchor, constant: 32),
            blueButton.heightAnchor.constraint(equalToConstant: 46)
        ])
    }
    //MARK: Button objc methods-
    @objc func tapToRedButton() {
        delegate?.changeBackgroundColor(color: .red)
        self.navigationController?.popViewController(animated: true)
    }
    @objc func tapToBlueButton() {
        delegate?.changeBackgroundColor(color: .blue)
        self.navigationController?.popViewController(animated: true)
    }
}
