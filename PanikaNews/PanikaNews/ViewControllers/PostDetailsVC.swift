//
//  PostDetailsVC.swift
//  PanikaNews
//
//  Created by Temur Chitashvili on 19.04.24.
//

import UIKit

class PostDetailsVC: UIViewController {
    //MARK: UI Components-
    let pagesTitle = UILabel()
    var postsImage = UIImageView()
    var postsTime = UILabel()
    var postsDescriptionTextView = UITextView()
    let backButton = UIButton()
    
    //MARK: Life Cycles-
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    //MARK: Setup UI-
    func setupUI() {
        setPagesTitle()
        setPostsImage()
        setPostsTime()
        setPostsDescriptionTextView()
        setBackButton()
    }
    
    //MARK: Set UI Components-
    func setPagesTitle() {
        view.addSubview(pagesTitle)
        pagesTitle.translatesAutoresizingMaskIntoConstraints = false
        setConstraintsToPagesTitle()
        pagesTitle.text = "Details"
        pagesTitle.textColor = .black
        pagesTitle.font = UIFont(name: "SpaceGrotesk-SemiBold", size: 24)
    }
    
    func setPostsImage() {
        view.addSubview(postsImage)
        postsImage.translatesAutoresizingMaskIntoConstraints = false
        setConstraintsToPostsImage()
    }
    
    func setPostsTime() {
        view.addSubview(postsTime)
        postsTime.translatesAutoresizingMaskIntoConstraints = false
        setConstraintsToPostsTime()
        postsTime.textAlignment = .right
        postsTime.font = UIFont(name: "FiraGO-Medium", size: 16)
        postsTime.textColor = .black
    }

    func setPostsDescriptionTextView() {
        view.addSubview(postsDescriptionTextView)
        postsDescriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        setConstraintsToPostsDescriptionTextView()
        postsDescriptionTextView.textAlignment = .left
        postsDescriptionTextView.font = UIFont(name: "FiraGO-Medium", size: 14)
        postsDescriptionTextView.textColor = .black
        postsDescriptionTextView.isEditable = false
    }
    
    func setBackButton() {
        view.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        setConstraintsToBackButton()
        backButton.titleLabel?.textAlignment = .center
        backButton.layer.cornerRadius = 25
        backButton.backgroundColor = .blue
        backButton.clipsToBounds = true
        backButton.titleLabel?.font = UIFont(name: "FiraGO-Medium", size: 14)
        backButton.setTitle("უკან", for: .normal)
        backButton.setTitleColor(.white, for: .normal)
        backButton.addAction(UIAction(title: "Go To Main Page", handler: { [weak self] _ in
            self?.navigationController?.popViewController(animated: true)
        }), for: .touchUpInside)
    }
    
    //MARK: Set Constraints-
    func setConstraintsToPagesTitle() {
        NSLayoutConstraint.activate([
            pagesTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            pagesTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            pagesTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -271),
            pagesTitle.heightAnchor.constraint(equalToConstant: 31),
        ])
    }
    
    func setConstraintsToPostsImage() {
        NSLayoutConstraint.activate([
            postsImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 111),
            postsImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            postsImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            postsImage.heightAnchor.constraint(equalToConstant: 190),
        ])
    }
    
    func setConstraintsToPostsTime() {
        NSLayoutConstraint.activate([
            postsTime.topAnchor.constraint(equalTo: view.topAnchor, constant: 314),
            postsTime.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 313),
            postsTime.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            postsTime.heightAnchor.constraint(equalToConstant: 19),
        ])
    }
    
    func setConstraintsToPostsDescriptionTextView() {
        NSLayoutConstraint.activate([
            postsDescriptionTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 359),
            postsDescriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -166),
            postsDescriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            postsDescriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
        ])
    }
    
    func setConstraintsToBackButton() {
           NSLayoutConstraint.activate([
            backButton.heightAnchor.constraint(equalToConstant: 48),
            backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -122),
            backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -103),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 121),
           ])
       }
}
