//
//  AHEPACell.swift
//  AHEPAHellas
//
//  Created by Angelos Staboulis on 22/09/2019.
//  Copyright © 2019 Angelos Staboulis. All rights reserved.
//

import UIKit

class AHEPACell: UITableViewCell {
    @IBOutlet var imgLogo: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
