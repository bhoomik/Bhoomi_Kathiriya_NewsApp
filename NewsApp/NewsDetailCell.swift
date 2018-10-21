//
//  NewsDetailCell.swift
//  NewsApp
//
//  Created by Bhoomi Kathiriya on 20/10/18.
//  Copyright © 2018 Bhoomi Kathiriya. All rights reserved.
//

import UIKit

class NewsDetailCell: UITableViewCell {

    
    
    @IBOutlet weak var viewContainer : UIView?
    @IBOutlet weak var ivNewsImage : UIImageView?
    
    @IBOutlet weak var stackviewDescription : UIStackView?
    
    @IBOutlet weak var lblAuthor : UILabel?
    @IBOutlet weak var lblTitle : UILabel?
    @IBOutlet weak var lblDescription : UILabel?
    @IBOutlet weak var lblPublishedAt : UILabel?
    @IBOutlet weak var lblNewsURL : UILabel?
    
    @IBOutlet weak var btnMore : UIButton?

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    
    
    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
