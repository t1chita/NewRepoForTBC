//
//  CatCell.swift
//  CatsApp
//
//  Created by Temur Chitashvili on 02.05.24.
//

import UIKit

class CatCell: UITableViewCell {
    
    //MARK: - UIComponents
    static let identifier = "CatCell"
    
    let rectangleView: UIView = {
        let uiView = UIView()
        uiView.translatesAutoresizingMaskIntoConstraints = false
        uiView.layer.borderColor = UIColor.systemBackground.cgColor
        uiView.clipsToBounds = true
        uiView.layer.borderWidth = 1
        uiView.layer.borderColor = UIColor.label.cgColor
        uiView.layer.cornerRadius = 17
        return uiView
    }()
    
    let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = .catBackground
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let factLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 0
        return label
    }()
    
    //MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configure
    func configure(fact: String) {
        self.factLabel.text = fact
    }
    
    //MARK: - Setup UI
    private func setupUI() {
        setConstraintsToRectangleView()
        setConstraintsToBackGroundImage()
        setConstraintsToFactLabel()
        selectionStyle = .none
    }
    
    //MARK: - Set Constrainst To UI Components
    private func setConstraintsToRectangleView() {
        addSubview(rectangleView)
        NSLayoutConstraint.activate([
            rectangleView.topAnchor.constraint(equalTo: topAnchor),
            rectangleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            rectangleView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            rectangleView.trailingAnchor.constraint(equalTo: trailingAnchor , constant: -16),
        ])
    }
    
    private func setConstraintsToBackGroundImage() {
        rectangleView.addSubview(backgroundImage)
        sendSubviewToBack(backgroundImage)
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: rectangleView.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: rectangleView.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: rectangleView.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: rectangleView.trailingAnchor),
        ])
    }
    
    private func setConstraintsToFactLabel() {
        rectangleView.addSubview(factLabel)
        NSLayoutConstraint.activate([
            factLabel.centerXAnchor.constraint(equalTo: rectangleView.centerXAnchor),
            factLabel.centerYAnchor.constraint(equalTo: rectangleView.centerYAnchor),
            factLabel.topAnchor.constraint(equalTo: rectangleView.topAnchor),
            factLabel.leadingAnchor.constraint(equalTo: rectangleView.leadingAnchor, constant: 16)
        ])
    }
}
