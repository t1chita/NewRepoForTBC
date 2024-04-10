//
//  DescriptionPageVC.swift
//  UIFourthLecture
//
//  Created by Temur Chitashvili on 10.04.24.
//

import UIKit

class DescriptionPageVC: UIViewController {
    //MARK: -UI Components-
    let backgroundImage: UIImageView = {
        var image = UIImageView(image: .background)
        return image
    }()
    var zodiacSignImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    let zodiacSignNameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    let zodiacSignDescriptionTextView: UILabel = {
        let textView = UILabel()
        textView.text = ""
        textView.textColor = .descriptionLabel
        textView.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textView.backgroundColor = UIColor.clear
        textView.numberOfLines = 0
        return textView
    }()
    let goToPoralSignButton: UIButton = {
        let button = UIButton()
        button.setTitle("პორალური ნიშანი", for: .normal)
        button.backgroundColor = .nextButton
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 12
        return button
    }()
    //MARK: -viewDidLoad-
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackgroundImage()
        addSignImage()
        addZodiacNameLabel()
        addDescriptionTextView()
        addGoToPoralButton()
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
            zodiacSignImage.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 110),
            zodiacSignImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -110),
            zodiacSignImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 55),
            zodiacSignImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -601)
        ])
    }
    func addZodiacNameLabel() {
        view.addSubview(zodiacSignNameLabel)
        zodiacSignNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            zodiacSignNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 130),
            zodiacSignNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -130),
            zodiacSignNameLabel.topAnchor.constraint(equalTo: zodiacSignImage.bottomAnchor, constant: 29),
            zodiacSignNameLabel.heightAnchor.constraint(equalToConstant: 34)
        ])
    }
    func addDescriptionTextView() {
        view.addSubview(zodiacSignDescriptionTextView)
        zodiacSignDescriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            zodiacSignDescriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            zodiacSignDescriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            zodiacSignDescriptionTextView.topAnchor.constraint(equalTo: zodiacSignNameLabel.bottomAnchor, constant: 30),
            zodiacSignDescriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -122),
        ])
    }
        func addGoToPoralButton() {
            view.addSubview(goToPoralSignButton)
            goToPoralSignButton.translatesAutoresizingMaskIntoConstraints = false
            goToPoralSignButton.addTarget(self, action: #selector(tapGoToPoralSignButton), for: .touchUpInside)
            
            NSLayoutConstraint.activate([
                goToPoralSignButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                goToPoralSignButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                goToPoralSignButton.topAnchor.constraint(equalTo: zodiacSignDescriptionTextView.bottomAnchor, constant: 46),
                goToPoralSignButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
            ])
    }
    //MARK: Button objc methods-
    @objc func tapGoToPoralSignButton() {
        let OppositeSignPageVC = OppositeSignPageVC()
//        switch
        self.navigationController?.pushViewController(OppositeSignPageVC, animated: true)
    }
}
