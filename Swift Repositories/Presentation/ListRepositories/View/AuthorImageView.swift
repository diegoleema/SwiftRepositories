//
//  AuthorImageView.swift
//  Swift Repositories
//
//  Created by Diego Lima on 12/10/20.
//

import UIKit

/**
 Visual Elements of UIImageView necessary to show image author
 
 */
class AuthorImageView: UIImageView {

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        image = UIImage(named: "placeholder")

        layer.cornerRadius = 10.0
        layer.shadowOffset = CGSize(width: -2, height: 2)
        layer.shadowOpacity = 0.5

        contentMode = .scaleAspectFill
        clipsToBounds = true
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
