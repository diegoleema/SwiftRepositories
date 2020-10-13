//
//  RepositoryTableViewCell.swift
//  Swift Repositories
//
//  Created by Diego Lima on 12/10/20.
//

import UIKit

/**
 Visual Elements of List Swift Repositories necessary to show data in tableview

 */
class RepositoryTableViewCell: UITableViewCell {
    public static let identifier = "repositoryCell"
    
    private var nameReposlabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private var nameAuthorlabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .gray
        label.textAlignment = .right
        return label
    }()
    
    private var starsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .gray
        return label
    }()
    
    private var starImage: UIImageView = {
        let image = UIImage(named: "star")
        let imageView = UIImageView(frame: .zero)
        imageView.image = image
        return imageView
    }()
    
    private var authorImage: UIImageView = AuthorImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setImageView()
        setReposLabel()
        setStarImageView()
        setStarsLabel()
        setAuthorLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setImageView() {
        addSubview(authorImage)
        authorImage.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        authorImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        authorImage.widthAnchor.constraint(equalToConstant: 35).isActive = true
        authorImage.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
    private func setStarImageView() {
        addSubview(starImage)
        starImage.translatesAutoresizingMaskIntoConstraints = false
        starImage.topAnchor.constraint(equalTo: authorImage.bottomAnchor, constant: 5).isActive = true
        starImage.leadingAnchor.constraint(equalTo: nameReposlabel.leadingAnchor).isActive = true
        starImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        starImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    private func setReposLabel() {
        addSubview(nameReposlabel)
        nameReposlabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        nameReposlabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        nameReposlabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -10).isActive = true
        
    }
    
    private func setAuthorLabel() {
        addSubview(nameAuthorlabel)
        nameAuthorlabel.trailingAnchor.constraint(equalTo: authorImage.trailingAnchor, constant: 5).isActive = true
        nameAuthorlabel.centerYAnchor.constraint(equalTo: starsLabel.centerYAnchor).isActive = true
    }
    
    private func setStarsLabel() {
        addSubview(starsLabel)
        starsLabel.leadingAnchor.constraint(equalTo: starImage.trailingAnchor, constant: 5).isActive = true
        starsLabel.centerYAnchor.constraint(equalTo: starImage.centerYAnchor, constant: 1).isActive = true
    }
    
    func setRepositoryInfo(name: String, authorName: String, starsCount: Int, urlImage: String) {
        nameAuthorlabel.text = authorName
        starsLabel.text = starsCount.roundedWithAbbreviations
        nameReposlabel.text = name
        
        //load async image from URL
        authorImage.imageFromServerURL(urlString: urlImage)
    }
}
