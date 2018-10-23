//
//  ShowDetailsImageCell.swift
//  TVShows
//
//  Created by Ivan Milicevic on 22/10/2018.
//  Copyright © 2018 Ivan Milicevic. All rights reserved.
//

import UIKit
import Kingfisher

class ShowDetailsImageCell: UITableViewCell {

    @IBOutlet weak var showDetailsImageView: UIImageView!

    // MARK: - Private
    private let placeholderImg: UIImage = UIImage(named: "missing")!

    // MARK: - View Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = UITableViewCell.SelectionStyle.none
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        //TODO
    }

    // MARK: - Functions
    func configure(with item: ShowDetails?) {
        guard
            let token = NetworkManager.loginData?.token,
            let item = item
            else {
                showDetailsImageView.image = placeholderImg
                return
        }
        
        let url = URL(string: "https://api.infinum.academy\(item.imageUrl)")
        let modifier = AnyModifier { request in
            var r = request
            r.setValue(token, forHTTPHeaderField: "Authorization")
            return r
        }

        showDetailsImageView.kf.setImage(with: url,
                              placeholder: self.placeholderImg,
                              options: [.requestModifier(modifier)])
    }
}
