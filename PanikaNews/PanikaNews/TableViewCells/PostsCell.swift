//
//  PostsCell.swift
//  PanikaNews
//
//  Created by Temur Chitashvili on 19.04.24.
//

import UIKit

class PostsCell: UITableViewCell {
    //MARK: UI Components-
    var timeLabel = UILabel()
    var headerLabel = UILabel()
    var photoImageView = UIImageView()
    static let identifier = "PostsCell"
    
    //MARK: init-
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: setup UI-
    func setupUI() {
        setTimeLabel()
        setHeaderLabel()
        setasdasa()
        asasa()
    }
    
    func configure(time: String, header: String) {
        timeLabel.text = time
        headerLabel.text = header
    }
    
    //MARK: set UI Components-
    func setTimeLabel() {
        addSubview(timeLabel)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        setConstraintsToTimeLabel()
        timeLabel.textAlignment = .center
        timeLabel.font = UIFont(name: "FiraGO-Medium", size: 12)
        timeLabel.textColor = .white
    }
    
    func setHeaderLabel() {
        addSubview(headerLabel)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        setConstraintsToHeaderLabel()
        headerLabel.textAlignment = .center
        headerLabel.font = UIFont(name: "FiraGO-Medium", size: 14)
        headerLabel.textColor = .white
        headerLabel.numberOfLines = 0
    }
    func setasdasa() {
        addSubview(photoImageView)
        sendSubviewToBack(photoImageView)
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.clipsToBounds = true
        photoImageView.image = .temporaryBackground
        photoImageView.contentMode = .scaleAspectFill
    }
    //MARK: set Constraints To UI Components-
    func setConstraintsToTimeLabel() {
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            timeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            timeLabel.widthAnchor.constraint(equalToConstant: 32),
            timeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -78),
        ])
    }
    
    func setConstraintsToHeaderLabel() {
        NSLayoutConstraint.activate([
            headerLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            headerLabel.heightAnchor.constraint(equalToConstant: 38),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
    
    func asasa() {
        NSLayoutConstraint.activate([
        photoImageView.topAnchor.constraint(equalTo: topAnchor),
        photoImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
        photoImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
