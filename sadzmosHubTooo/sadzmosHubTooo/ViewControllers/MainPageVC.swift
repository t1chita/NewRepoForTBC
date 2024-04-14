//
//  MainPageVC.swift
//  sadzmosHubTooo
//
//  Created by Temur Chitashvili on 15.04.24.
//

import UIKit
protocol PostAddable {
    func add(post: Post)
}

class MainPageVC: UIViewController,PostAddable {
    //MARK: UI Components-
    var postsCollectionView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection         = .horizontal
        collectionViewFlowLayout.estimatedItemSize       = UICollectionViewFlowLayout.automaticSize
        collectionViewFlowLayout.minimumLineSpacing      = 16
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 327, height: 448), collectionViewLayout: collectionViewFlowLayout)
        return collectionView
    }()
    
    var postsInformation: [Post] = []
    let addNewSadzmosPostButton  = UIButton()
    let backgroundImage          = UIImageView()
    var delegate: PostAddable?
    
    //MARK: Life Cycles-
    override func viewDidLoad() {
        super.viewDidLoad()
        postsInformation = fetchData()
        setupUI()
    }
    
    func add(post: Post) {
        postsInformation.append(post)
        postsCollectionView.reloadData()
    }
    
    func setupUI() {
        setBackgroundImage()
        postsInformation = fetchData()
        setPostsCollectionView()
        setAddNewSadzmosPostButton()
    }
    
    //MARK: configuration Of UI Components-
    func setBackgroundImage() {
        view.addSubview(backgroundImage)
        setConstraintsToBackgroundImage()
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.contentMode                               = .scaleAspectFill
        backgroundImage.image                                     = .background
    }
    
    func setPostsCollectionView() {
        view.addSubview(postsCollectionView)
        setConstraintsToPostsCollectionView()
        postsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        postsCollectionView.register(PostsCell.self, forCellWithReuseIdentifier: PostsCell.identifier)
        postsCollectionView.backgroundColor = .clear
        postsCollectionView.dataSource      = self
        postsCollectionView.delegate        = self
    }
    
    func setAddNewSadzmosPostButton() {
        view.addSubview(addNewSadzmosPostButton)
        setConstraintsAddNewSadzmosPostButton()
        addNewSadzmosPostButton.translatesAutoresizingMaskIntoConstraints = false
        addNewSadzmosPostButton.titleLabel?.textAlignment                 = .center
        addNewSadzmosPostButton.layer.cornerRadius                        = 25
        addNewSadzmosPostButton.titleLabel?.font                          = UIFont(name: "FiraGO-Medium", size: 14)
        addNewSadzmosPostButton.backgroundColor                           = .startButtonBackground
        addNewSadzmosPostButton.clipsToBounds                             = true
        addNewSadzmosPostButton.setTitleColor(.white, for: .normal)
        addNewSadzmosPostButton.setTitle("ახალი საძმოს პოსტის დამატება", for: .normal)
        addNewSadzmosPostButton.addAction(UIAction(title: "Go To Add New Card Page", handler: {[weak self] _ in
            self?.goToAddNewCardPageVC()
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
    
    func setConstraintsToPostsCollectionView() {
        NSLayoutConstraint.activate([
            postsCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 77),
            postsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -287),
            postsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    
    func setConstraintsAddNewSadzmosPostButton() {
        NSLayoutConstraint.activate([
            addNewSadzmosPostButton.heightAnchor.constraint(equalToConstant: 48),
            addNewSadzmosPostButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42),
            addNewSadzmosPostButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -104),
            addNewSadzmosPostButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -42)
          
        ])
    }
    
    func goToAddNewCardPageVC() {
        let addNewCardPageVC = AddNewCardPageVC()
        addNewCardPageVC.delegate = self
        addNewCardPageVC.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationController?.pushViewController(addNewCardPageVC, animated: true)
    }
}

//MARK: Extensions For MainPageVC
extension MainPageVC: UICollectionViewDelegate {
    
}

extension MainPageVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        postsInformation.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostsCell.identifier, for: indexPath) as! PostsCell
        cell.configuration(image: postsInformation[indexPath.row].icon, headerText: postsInformation[indexPath.row].headerLabel, descriptionText: postsInformation[indexPath.row].descriptionLabel)
        return cell
    }
}

extension MainPageVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
    }
}

extension MainPageVC {
    func fetchData() -> [Post] {
        return postsArray
    }
}
