//
//  ShowDetailsDescriptionCell.swift
//  TVShows
//
//  Created by Ivan Milicevic on 22/10/2018.
//  Copyright © 2018 Ivan Milicevic. All rights reserved.
//

import UIKit

class ShowDetailsDescriptionCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var numberOfEpisodesLabel: UILabel!

    // MARK: - View Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = UITableViewCell.SelectionStyle.none
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        titleLabel.text = nil
        descriptionTextView.text = nil
        numberOfEpisodesLabel.text = "0"
    }


    // MARK: - Functions
    func configure(with item: ShowDetails, episodesCount: Int) {
        titleLabel.text = item.title
        descriptionTextView.text = item.description
        numberOfEpisodesLabel.text = String(episodesCount)
    }

}
