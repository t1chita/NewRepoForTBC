//
//  LoginPageViewController.swift
//  CountryAppMVVM
//
//  Created by Temur Chitashvili on 26.04.24.
//

import UIKit

class LoginPageViewController: UIViewController {
    let loginPageView: LoginPageView
    let loginPageViewModel: LoginPageViewModel
    
    init() {
        self.loginPageView = LoginPageView()
        self.loginPageViewModel = LoginPageViewModel()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = loginPageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginPageView.delegate = self
    }
}

extension LoginPageViewController: LoginPageViewDelegate {
    func goToMainPage() {
            //        let mainPageViewController = MainPageViewController()
            //
            //
            //              navigationController?.setViewControllers([mainPageViewController], animated: true)
            //        } else {
            //            let alert = UIAlertController(title: "🚨ERROR🚨", message: "თქვენ არ მიგითითებიათ სწორი ინფორმაცია,გთხოვთ მიუთითოთ XELTAVIDAN!", preferredStyle: .alert)
            //                    alert.addAction(UIAlertAction(title: "Cancel", style: .default))
            //            self.present(alert, animated: true, completion: nil)
            //        }
        }
    }
