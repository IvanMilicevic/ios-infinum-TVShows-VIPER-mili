//
//  ShowDetailsImageCell.swift
//  TVShows
//
//  Created by Ivan Milicevic on 22/10/2018.
//  Copyright © 2018 Ivan Milicevic. All rights reserved.
//

import UIKit

class ShowDetailsImageCell: UITableViewCell {

    @IBOutlet weak var showDetailsImageView: UIImageView!

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
    func configure(with item: ShowDetails) {
        //TODO
    }
}
