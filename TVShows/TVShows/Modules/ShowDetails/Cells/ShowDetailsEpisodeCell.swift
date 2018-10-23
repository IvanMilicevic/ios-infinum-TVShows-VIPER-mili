//
//  ShowDetailsEpisodeCell.swift
//  TVShows
//
//  Created by Ivan Milicevic on 22/10/2018.
//  Copyright © 2018 Ivan Milicevic. All rights reserved.
//

import UIKit

class ShowDetailsEpisodeCell: UITableViewCell {

    @IBOutlet weak var episodeTitleLabel: UILabel!
    @IBOutlet weak var seasonEpisodeLabel: UILabel!

    // MARK: - View Lifecycle
    override func prepareForReuse() {
        super.prepareForReuse()

        episodeTitleLabel.text = nil
        seasonEpisodeLabel.text = nil
    }

    // MARK: - Functions
    func configure(with item: ShowEpisode) {
        var episodeNum = "?"
        var seasonNum = "?"

        if let season = item.season {
            seasonNum = String(season)
        }

        if let episode = item.episodeNumber {
            episodeNum = String(episode)
        }

        seasonEpisodeLabel.text = "S\(seasonNum) Ep\(episodeNum)"
        episodeTitleLabel.text = item.title
    }
    
}
