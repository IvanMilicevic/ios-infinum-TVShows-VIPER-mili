//
//  HomeCell.swift
//  TVShows
//
//  Created by Ivan Milicevic on 19/10/2018.
//  Copyright © 2018 Ivan Milicevic. All rights reserved.
//

import UIKit
import Kingfisher
import Alamofire

class HomeCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    
    // MARK: - Private
    private let placeholderImg: UIImage = UIImage(named: "missing")!

    // MARK: - View Lifecycle
    override func prepareForReuse() {
        super.prepareForReuse()
        cellLabel.text = nil
        cellImage.image = UIImage(named: "ic-camera")
    }

    // MARK: - Functions
    func configure(with item: Show){
        cellLabel.text = item.title
    }

}
