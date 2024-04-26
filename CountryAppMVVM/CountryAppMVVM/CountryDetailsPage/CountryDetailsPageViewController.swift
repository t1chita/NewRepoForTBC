//
//  CountryDetailsPageViewController.swift
//  CountryAppMVVM
//
//  Created by Temur Chitashvili on 25.04.24.
//

import UIKit

class CountryDetailsPageViewController: UIViewController {
    var countryDetailsPageViewModel: CountryDetailsPageViewModel?
    var countryDetailsPageView: CountryDetailsPageView
    var country: Country?
    
    init() {
        self.countryDetailsPageView = CountryDetailsPageView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = countryDetailsPageView
        countryDetailsPageView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    func updateView() {
        setbasicInformationStackView()
        if let urlString = countryDetailsPageViewModel?.flag,let url = URL(string: urlString) {
            countryDetailsPageView.countriesFlag.loadImage(from: url)
        }
        countryDetailsPageView.countriesName.text = countryDetailsPageViewModel?.name
        countryDetailsPageView.aboutTheFlagDescription.text = countryDetailsPageViewModel?.flagDescription
        countryDetailsPageView.aboutTheFlagTitle.text = countryDetailsPageViewModel?.aboutTheFlagTitle
        countryDetailsPageView.basicInformationLabel.text = countryDetailsPageViewModel?.basicInformationLabel
    }
    
    func setbasicInformationStackView() {
        var index = 0
        for stackView in countryDetailsPageViewModel!.stackViews{
            countryDetailsPageView.basicInformationStackView.addArrangedSubview(stackView)
        }
        for stackView in countryDetailsPageViewModel!.stackViews {
            stackView.generalLabel.text = countryDetailsPageViewModel?.generalLabelsTexts[index]
            index += 1
        }
    }
}

extension CountryDetailsPageViewController: CountryDetailsPageViewDelegate {
    func goToMainPage() {
        navigationController?.popViewController(animated: false)
    } 
}
