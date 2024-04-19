//
//  MainPageVC.swift
//  PanikaNews
//
//  Created by Temur Chitashvili on 19.04.24.
//

import UIKit

class MainPageVC: UIViewController {
    //MARK: UI Components -
    let headerLabel = UILabel()
    let postsTableView = UITableView()
    var postsArray: [Post] = []
    let imediNewsAPI = "https://imedinews.ge/api/categorysidebarnews/get#"
    
    //MARK: Life Cylces-
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUi()
        NetworkService().getPosts(urlString: imediNewsAPI) { (result: PostsResponseData?, error: Error?) in
            self.postsArray = result?.postsData ?? []
            self.postsTableView.reloadData()
        }
    }
    
    //MARK: SetUP Method-
    func setupUi() {
        setHeaderLabel()
        setPostsTableView()
    }
    
    //MARK: Set UI Components-
    func setHeaderLabel() {
        view.addSubview(headerLabel)
        setConstraintsToHeaderLabel()
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.textColor = .black
        headerLabel.text = "Panicka News"
        headerLabel.font = UIFont(name: "SpaceGrotesk-SemiBold", size: 24)
    }
    
    func setPostsTableView() {
        view.addSubview(postsTableView)
        setConstraintsToPostsTableView()
        postsTableView.translatesAutoresizingMaskIntoConstraints = false
        postsTableView.delegate = self
        postsTableView.dataSource = self
        postsTableView.rowHeight = 108
        postsTableView.backgroundColor = .clear
        postsTableView.register(PostsCell.self, forCellReuseIdentifier: PostsCell.identifier)
    }
    
    //MARK: Set Constraints To UI Components-
    func setConstraintsToHeaderLabel() {
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            headerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -192),
            headerLabel.heightAnchor.constraint(equalToConstant: 31),
        ])
    }
    
    func setConstraintsToPostsTableView() {
        NSLayoutConstraint.activate([
            postsTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 111),
            postsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            postsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            postsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

