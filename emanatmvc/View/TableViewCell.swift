//
//  TableViewCell.swift
//  emanatmvc
//
//  Created by Ayxan Seferli on 06.06.22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(quoteModel: Quotes) {
        authorLabel.text = quoteModel.author
        quoteLabel.text = quoteModel.quote
    }

}
