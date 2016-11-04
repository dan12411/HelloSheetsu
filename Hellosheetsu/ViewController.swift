//
//  ViewController.swift
//  Hellosheetsu
//
//  Created by 洪德晟 on 2016/11/3.
//  Copyright © 2016年 洪德晟. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "http://139.162.49.212/books")
        var urlRequest = URLRequest(url: url!)
        
        urlRequest.httpMethod = "POST"
        
        let postStr = "name=dan&description=99&isbn=0000000"
        
        let data = postStr.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.uploadTask(with: urlRequest, from: data) {
            (data:Data?, response:URLResponse?, err:Error?) -> Void in
            
            if err != nil {
                print("===\(err?.localizedDescription)")
            }
            
            print("\(response)")
            
            
            if let returnData = data {
                do {
                    let dic = try JSONSerialization.jsonObject(with: returnData) as![String:AnyObject]
                    //let status = dic["success"] as! Bool
                    //if status {
                    //    print("success")
                    //}
                    
                }
                catch {
                    
                }
            }
            
        }
        
        
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

