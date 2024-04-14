//
//  OnboardingVC.swift
//  sadzmosHubTooo
//
//  Created by Temur Chitashvili on 15.04.24.
//

import UIKit

class OnboardingVC: UIViewController {
    //MARK: UI Components-
    let backgroundImage = UIImageView()
    let titleLabel      = UILabel()
    let startButton     = UIButton()
    
    //MARK: Life Cycles-
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    func setupUI() {
        setBackgroundImage()
        setTitleLabel()
        setStartButton()
    }
    
    //MARK: configuration Of UIComponents-
    func setBackgroundImage() {
        view.addSubview(backgroundImage)
        setConstraintsToBackgroundImage()
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.contentMode                               = .scaleAspectFill
        backgroundImage.image                                     = .onboarding
    }
    
    func setTitleLabel() {
        view.addSubview(titleLabel)
        setConstraintsToTitleLabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines                             = 0
        titleLabel.textAlignment                             = .left
        titleLabel.textColor                                 = .white
        titleLabel.text                                      = "შედი აპლიკაციაში და გაეცანი საძმოს ახალ ამბებს"
        titleLabel.font                                      = UIFont(name: "FiraGO-Regular", size: 30)
    }
    
    func setStartButton() {
        view.addSubview(startButton)
        setConstraintsToStartButton()
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.titleLabel?.textAlignment                 = .center
        startButton.layer.cornerRadius                        = 25
        startButton.backgroundColor                           = .startButtonBackground
        startButton.clipsToBounds                             = true
        startButton.titleLabel?.font = UIFont(name: "FiraGO-Medium", size: 14)
        startButton.setTitleColor(.white, for: .normal)
        startButton.setTitle("დაწყება", for: .normal)
        startButton.addAction(UIAction(title: "Go To Main Page", handler: { [weak self] _ in
            self?.goToMainPageVC()
        }), for: .touchUpInside)
    }
    
    //MARK: setConstraints-
    func setConstraintsToBackgroundImage() {
        NSLayoutConstraint.activate([
            backgroundImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backgroundImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundImage.widthAnchor.constraint(equalTo: view.widthAnchor),
            backgroundImage.heightAnchor.constraint(equalTo: view.heightAnchor),
        ])
    }
    
    func setConstraintsToTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 382),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -91),
            titleLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -238),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
        ])
    }
    
    func setConstraintsToStartButton() {
        NSLayoutConstraint.activate([
            startButton.heightAnchor.constraint(equalToConstant: 48),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 222),
        ])
    }
    
    func goToMainPageVC() {
        let mainPageVC = MainPageVC()
        mainPageVC.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationController?.pushViewController(mainPageVC, animated: true)
    }
}

