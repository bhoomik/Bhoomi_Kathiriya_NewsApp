//
//  WebViewVC.swift
//  Swift_MVP
//
//  Created by Bhoomi Kathiriya on 08/07/18.

//

import UIKit

class WebViewVC: UIViewController
{
    
    
    @IBOutlet weak var webView  : UIWebView?
    var objNews : News?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadNewsData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func setNewsDetail(news:News)
    {
       print("news object web view is",news.strNewsURL)
        self.objNews = news
    }
    
    
    func loadNewsData()
    {
        print("2news object web view is",self.objNews?.strNewsURL)
        
        
        let url = URL (string: (self.objNews?.strNewsURL!)!)
        let requestObj = URLRequest(url: url!)
        webView?.loadRequest(requestObj)
        
        
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
