//
//  NewsDetailVC.swift
//  NewsApp
//
//  Created by Bhoomi Kathiriya on 20/10/18.
//  Copyright © 2018 Bhoomi Kathiriya. All rights reserved.
//

import UIKit

class NewsDetailVC: UIViewController
{
  
    var objNews : NewsViewModel?
    
    var imgNews : UIImage?
    @IBOutlet weak var tblNewsDetail : UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.commonInit()
        // Do any additional setup after loading the view.
    }
    
    func commonInit()  {
      
        self.title =  "News Detail"
       tblNewsDetail?.estimatedRowHeight = 100
        tblNewsDetail?.rowHeight = UITableView.automaticDimension
        
    }

    
    @objc func tapFunction(sender:UITapGestureRecognizer) {
        
        
        var lblURL : UILabel = sender.view as! UILabel
        self.performSegue(withIdentifier: "NewsDetailToWebURL", sender: self)
        
        print("tap working",lblURL.tag)
    }
    
    @objc func imageTapped(sender:UITapGestureRecognizer) {
        
        
         self.performSegue(withIdentifier: "NewsDetailToImage", sender: self)
        
        print("tap working image")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setNewsDetail(news:NewsViewModel)
    {
        
        self.objNews = news
        print("news object is",self.objNews?.name)
    }
    
    
    
    override open func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        print("prepare for segue")
        
        if (segue.identifier == "NewsDetailToWebURL")
        {
         
            var objVC : WebViewVC = segue.destination  as! WebViewVC
            
            objVC.setNewsDetail(news:self.objNews!)
        }
        
        
        if (segue.identifier == "NewsDetailToImage")
        {
            
            var objVC : ImageViewVC = segue.destination  as! ImageViewVC
            
            objVC.setImageDetail(image: self.imgNews!)
        }
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension NewsDetailVC : UITableViewDelegate,UITableViewDataSource
    
{
    //MARK: UITableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell : NewsDetailCell = tableView.dequeueReusableCell(withIdentifier: "NewsDetailCell", for: indexPath) as! NewsDetailCell
        
        
        
        let strURL = String(format: "%@",(self.objNews?.strURL)!)
        
        
        print("string url is",strURL)
        let tap = UITapGestureRecognizer(target: self, action: #selector(NewsDetailVC.tapFunction))
        cell.lblNewsURL?.isUserInteractionEnabled = true
        cell.lblNewsURL?.addGestureRecognizer(tap)
    
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(NewsDetailVC.imageTapped))
        cell.ivNewsImage?.isUserInteractionEnabled = true
        cell.ivNewsImage?.addGestureRecognizer(tap2)
        
        let url = URL(string: strURL)
        
        if((objNews?.strBy?.count)! > 0)
        {
        cell.lblAuthor?.text =  NSString(format:"Author: %@",(objNews?.strBy!)!) as String
        
        }
        
        if((objNews?.name?.count)! > 0)
        {
            cell.lblTitle?.text =  NSString(format:"Title: %@",(objNews?.name!)!) as String
            
        }
        
        if((objNews?.strDescription?.count)! > 0)
        {
            cell.lblDescription?.text =  NSString(format:"Description: %@",(objNews?.strDescription!)!) as String
            
        }
        
        if((objNews?.strPublishedDate?.count)! > 0)
        {
            cell.lblPublishedAt?.text =  NSString(format:"Published At: %@",(objNews?.strPublishedDate!)!) as String
            
        }
        print("cell for row news url is",objNews?.strNewsURL)
        if(objNews?.strNewsURL != nil)
        {
        if((objNews?.strNewsURL?.count)! > 0)
        {
            cell.lblNewsURL?.text =  NSString(format:"URL: %@",(objNews?.strNewsURL!)!) as String
            
        }
        }
        
//        else
//        {
//            cell.lblAuthor?.text = ""
//        }
        // SDWebImageManager.shared().imageDownloader?.setValue(str as String, forHTTPHeaderField: "Authorization")
        
        
        cell.ivNewsImage?.sd_setImage(with: url, placeholderImage:nil, completed: { (image, error, cacheType, url) -> Void in
            if ((error) != nil)
            {
                print("erro is",error)
                
                cell.ivNewsImage?.image  = UIImage(named:"No_Image_Found")
                self.imgNews = cell.ivNewsImage?.image
                // set the placeholder image here
                
            } else
            {
                cell.ivNewsImage?.image = image
                self.imgNews = cell.ivNewsImage?.image
                
                //                if(image !=  nil)
                //                {
                //                item.image = image!
                //                self.collectionView?.reloadItems(at: [indexPath])
                //                print("image is",image)
                //                }
                // success ... use the image
            }
        })
      
        return cell
    }
    
    
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        
    
            
            
      
        
    }
    
    
}
