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

        guard
            let token = NetworkManager.loginData?.token,
            let imageUrl = item.imageUrl
            else {
                cellImage.image = placeholderImg
                return
        }

        let url = URL(string: "https://api.infinum.academy\(imageUrl)")
        let modifier = AnyModifier { request in
            var r = request
            r.setValue(token, forHTTPHeaderField: "Authorization")
            return r
        }

        cellImage.kf.setImage(with: url,
                                   placeholder: self.placeholderImg,
                                   options: [.requestModifier(modifier)])
    }

}
