//
//  NewsHeadline.swift
//  TopStories
//
//  Created by Tiffany Obi on 11/25/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import Foundation
// we have nested JSON so we need multiple structs to model of swift object after that.


// top level JSON - HeadlinesData.self because top level jSON is a dictionary
struct HeadlinesData: Codable {
    let results: [NewsHeadline] // "results" represents the JSON array of stories
}





struct NewsHeadline: Codable {
    let title: String
    let abstract: String
    let byline: String
}




extension HeadlinesData { // extension on the struct
    
    //parse the "topStoriesTechnology.json" into an array of NewsHeadline = [NewsHeadline]
    // note the jsonData is a dictionary
    
    static func getHeadlines() -> [NewsHeadline] {
        
        var headlines = [NewsHeadline]() // empty array of NewsHeadlines
        
        // Bundle() allows us to access (or read) our app's resources and files, ex: mp3 file or in our case the topStoriesTechnology.json
        
        //1. get URl to intended resource (topStoriesTechnology.json file we created)
    
        guard let fileURL = Bundle.main.url(forResource: "topStoriesTechnology", withExtension: "json") else {
            fatalError("Could not locate json file")
        }
        
        //2. get the data from the contents of the fileURL
        //we'll use Data(). it is a class that has a method contentsof
        do {
            let data = try Data(contentsOf: fileURL)
             //parse data to our Swift [NewsHeadline]
            
            let headlinesData = try JSONDecoder().decode(HeadlinesData.self, from: data)
            
            headlines = headlinesData.results
            
        } catch {
        fatalError(" failed to load contents \(error) ")
        }
        
        return headlines
    }
}
