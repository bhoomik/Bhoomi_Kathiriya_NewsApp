//
//  News.swift
//  NewsApp
//
//  Created by Bhoomi Kathiriya on 20/10/18.
//  Copyright © 2018 Bhoomi Kathiriya. All rights reserved.
//

import UIKit

class News: NSObject {

    var strTitle : String?
    var strDescription : String?
    var strBy : String?
    var strPubhisedDate : String?
    var strURL : String?
   // var strAuthor : String?
    var strNewsURL : String?
    
    init?(dictionary :JSONDictionary) {
        
         let name = dictionary["title"] as? String
            let description = dictionary["abstract"] as? String
        let By = dictionary["byline"] as? String
        let publisheddate = dictionary["published_date"] as? String
        let newsURL = dictionary["url"] as? String

        print("newsurl is",newsURL)
        let arrMedia : NSArray?  = dictionary["media"] as? NSArray
        
        print("arrmedia is",arrMedia)
        
        var dictMedia : NSDictionary? = arrMedia?.object(at: 0) as? NSDictionary
        print("dictmedia is",dictMedia)
        
        let arrMetadata : NSArray?  = dictMedia?["media-metadata"] as? NSArray

        print("arr metadaa is",arrMetadata)
        
        var dictURL : NSDictionary? = arrMetadata?.object(at: 0) as? NSDictionary
        
        let URL = dictURL?["url"] as? String

        print("url is",URL)
         //   let description = dictionary["description"] as? String
          /*  else {
                return ""
        }*/
        self.strTitle  = name
        self.strDescription = description
        self.strBy = By
        self.strPubhisedDate = publisheddate
        self.strURL = URL
        self.strNewsURL = newsURL
    }
    
    init(viewModel :NewsViewModel) {
        
        self.strBy = viewModel.strBy
        self.strTitle = viewModel.name
        self.strDescription = viewModel.strDescription
        self.strPubhisedDate = viewModel.strPublishedDate
        self.strURL = viewModel.strURL
        self.strNewsURL = viewModel.strNewsURL
    }
    
}
