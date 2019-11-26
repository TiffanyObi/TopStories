//
//  NewsDetailViewController.swift
//  TopStories
//
//  Created by Tiffany Obi on 11/26/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {

    @IBOutlet weak var headlineImageView: UIImageView!
    
    @IBOutlet weak var headlineAbstractTextView: UITextView!
    
    
    @IBOutlet weak var bylineLabel: UILabel!
    
    var newsHeadline : NewsHeadline?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    
    func updateUI(){
        guard  let headline = newsHeadline else {
            fatalError("newsheadlone is nil, verify prepare (for segue:)")
        }
        //Todo: set up image using URLSession() and DispatchQueue.main.async{...}
        
        navigationItem.title = headline.title
        headlineAbstractTextView.text = headline.abstract
        bylineLabel.text = headline.byline
    }

    

}
