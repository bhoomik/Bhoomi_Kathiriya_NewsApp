//
//  NewsListCell.swift
//  NewsApp
//
//  Created by Bhoomi Kathiriya on 20/10/18.
//  Copyright © 2018 Bhoomi Kathiriya. All rights reserved.
//

import UIKit

class NewsListCell: UITableViewCell {

    @IBOutlet weak var lblTitle : UILabel?
    @IBOutlet weak var lblNewsBy : UILabel?
    @IBOutlet weak var lblDate : UILabel?
    @IBOutlet weak var ivNews : UIImageView?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupData(objNewsInfo: NewsViewModel)
    
    {
        self.lblTitle?.text = objNewsInfo.name
        self.lblNewsBy?.text = objNewsInfo.strBy
        self.lblDate?.text = objNewsInfo.strPublishedDate
        
        let strURL : String? = String(format: "%@",objNewsInfo.strURL ?? String() ) 
        
        
        print("string url is",strURL)
        
        
        let url = URL(string: strURL ?? String())
        
        
        // SDWebImageManager.shared().imageDownloader?.setValue(str as String, forHTTPHeaderField: "Authorization")
        
        
        self.ivNews?.sd_setImage(with: url, placeholderImage:nil, completed: { (image, error, cacheType, url) -> Void in
            if ((error) != nil)
            {
                print("erro is",error)
                
                self.ivNews?.image  = UIImage(named:"No_Image_Found")
                
                // set the placeholder image here
                
            } else
            {
                self.ivNews?.image = image
                //                if(image !=  nil)
                //                {
                //                item.image = image!
                //                self.collectionView?.reloadItems(at: [indexPath])
                //                print("image is",image)
                //                }
                // success ... use the image
            }
        })
        
    
    }

}
