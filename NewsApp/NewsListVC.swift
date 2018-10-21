//
//  NewsListVC.swift
//  NewsApp
//
//  Created by Bhoomi Kathiriya on 20/10/18.
//  Copyright © 2018 Bhoomi Kathiriya. All rights reserved.
//

import UIKit

class NewsListVC: UIViewController {

    @IBOutlet weak var tblNewsList  : UITableView?
    private var newsservice :NewsService!
    private var newseListViewModel :NewsListViewModel!
    var selNewsIndex : Int? = 0

    var arrNewsVM : [NewsViewModel]  =  [NewsViewModel] ()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.commonInit()
        // Do any additional setup after loading the view.
    }
    

    func commonInit() {
        
        self.title = "News List"
        self.newsservice = NewsService()
        self.tblNewsList?.tableFooterView = UIView()
        self.newseListViewModel = NewsListViewModel(newsservice: self.newsservice)
        self.newseListViewModel.attachView(view: self)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension NewsListVC: NewsView
{
    
    func setNewsData(news: [NewsViewModel])
    {
        
        self.arrNewsVM = news
        
        DispatchQueue.main.async { () -> Void in
      
             self.tblNewsList?.reloadData()
            
        }
        print("update news data",self.arrNewsVM)
    }
    
    
}


extension NewsListVC:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        return self.arrNewsVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        
        
        let cell : NewsListCell = tableView.dequeueReusableCell(withIdentifier: "NewsListCell") as! NewsListCell
        
        
        let objNewsInfo : NewsViewModel = self.arrNewsVM[indexPath.row] 
        
        
        cell.setupData(objNewsInfo: objNewsInfo)
        
        
        
        return cell
        
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        self.selNewsIndex = indexPath.row
        
        self.performSegue(withIdentifier: "NewsListToDetail", sender: self)
        
        
    }
    
    override open func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        print("prepare for segue")
        
        if (segue.identifier == "NewsListToDetail")
        {
            let objVC : NewsDetailVC = segue.destination as! NewsDetailVC
            
            var objItem  = self.arrNewsVM[self.selNewsIndex!]
            
            objVC.setNewsDetail(news:objItem )
        }
        
    }
}
