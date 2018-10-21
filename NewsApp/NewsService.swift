//
//  LocationService.swift
//
//

//

import Foundation

class LocationService {
	
	
    
    
    public func createRequest(qMes: String, strURL: String, method: String , completionBlock: @escaping ([String: AnyObject]) -> Void,andFailureBlock failBlock: @escaping ((AnyObject) -> Void)) -> Void
    {
        
        
        
        let requestURL = URL(string: strURL)
        var request = URLRequest(url: requestURL!)
        
        request.httpMethod = method
        
        
       // var str  = ""
        
        
       
        
        request.httpBody = qMes.data(using: .utf8)
        
        let requestTask = URLSession.shared.dataTask(with: request)
        {
            (data: Data?, response: URLResponse?, error: Error?) in
            
            
            if let httpResponse = response as? HTTPURLResponse
            {
                print("status code is",httpResponse.statusCode)
                
                if (httpResponse.statusCode == 401)
                {
                    failBlock(httpResponse as AnyObject)
                    
                }
                
            }
            
            /* if(error != nil) {
             print("Error: \(error)")
             }else
             {
             
             
             let outputStr  = String(data: data!, encoding: String.Encoding.utf8) as String!
             //send this block to required place
             completionBlock(outputStr!);
             }*/
            
            if (error == nil)
            {
                
                do {
                    //create json object from data
                    //  if let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String: AnyObject]
                    
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? AnyObject
                    {
                        
                        print("retrieved json is",json)
                        
                        
                        
                        if json is Dictionary<AnyHashable,Any>
                        {
                            
                            let jsonResponse = json as! [String: AnyObject]
                            
                            print("Yes, it's a Dictionary")
                            let dictResponse = json as! NSDictionary
                            
                            print("dict response",dictResponse)
                            completionBlock(jsonResponse);
                            
                        }
                        if let array = json as? NSArray
                        {
                            
                            print("object is arrays",array)
                        }
                        
                        /*  if let array = json as? NSArray
                         {
                         
                         print("object is",array)
                         
                         var jsonResponse = json as! NSArray
                         print("responsse array is",jsonResponse)
                         completionBlock(jsonResponse)
                         
                         }*/
                        
                        // handle json...
                    }
                    
                } catch let error
                {
                    print("parsing error is",error.localizedDescription)
                    failBlock(error as AnyObject)
                }
            }
            else
            {
                failBlock(error as AnyObject)
                
                
            }
        }
        requestTask.resume()
    }
    
	
}






















