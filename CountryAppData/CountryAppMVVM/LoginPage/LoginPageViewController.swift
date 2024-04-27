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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        autoLogin()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginPageView.delegate = self
    }
    
    func autoLogin() {
        if !loginPageViewModel.getAllKeyChainItemsOfClass(kSecClassInternetPassword as String).isEmpty {
            UserDefaults.standard.set(false, forKey: "First Login")
            let mainPageViewController = MainPageViewController()
            navigationController?.pushViewController(mainPageViewController, animated: true)
        }else {
            return
        }
    }
}

extension LoginPageViewController: LoginPageViewDelegate {
    func goToMainPage() {
        
        if (loginPageView.usersNameStackView.textField.text != "" && loginPageView.usersPasswordtackView.textField.text != "" && loginPageView.repeatPasswordStackView.textField.text != "") && (loginPageView.usersPasswordtackView.textField.text == loginPageView.repeatPasswordStackView.textField.text) {
            let mainPageViewController = MainPageViewController()
            guard
                let newPerson = loginPageView.usersNameStackView.textField.text,
                let newPassword = loginPageView.usersPasswordtackView.textField.text else {
                print("Cant Unrwap")
                return
            }
            for dict in loginPageViewModel.getAllKeyChainItemsOfClass(kSecClassInternetPassword as String) {
                let username = dict.key
                if newPerson == username {
                    UserDefaults.standard.set(false, forKey: "First Login")
                    navigationController?.pushViewController(mainPageViewController, animated: true)
                    return
                }
            }
            do {
                try loginPageViewModel.save(userName: newPerson, password: newPassword)
                UserDefaults.standard.set(true, forKey: "First Login")
            } catch {
                print("Error")
            }
            navigationController?.pushViewController(mainPageViewController, animated: true)
        }
        else {
            let alert = UIAlertController(title: "🚨ERROR🚨", message: "თქვენ არ მიგითითებიათ სწორი ინფორმაცია,გთხოვთ მიუთითოთ XELTAVIDAN!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
