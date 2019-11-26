//
//  ImageClient.swift
//  TopStories
//
//  Created by Tiffany Obi on 11/26/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import Foundation

struct ImageClient {
    
    //takes in a url String and and uses a completion handler to capture processed image from the urlSource.
    //ex: "https://.....jpg"
    
    static func fetchImage(for urlString: String){
        
        guard let url = URL(string: urlString)
            else {
                fatalError("bad url \(urlString)")
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
          
          //check if an error exsists
            if let error = error {
                print("error:\(error)")
                //Todo: add enum error
                
            }
            //Todo:Check for valid status code of 200...299
            //Todo: check for valod mime type if image/jpeg 
        }
        
        dataTask.resume()
    }
        
        
}
