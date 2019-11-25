//
//  HeadlineCellTableViewCell.swift
//  TopStories
//
//  Created by Tiffany Obi on 11/25/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import UIKit

class HeadlineCellTableViewCell: UITableViewCell {

    @IBOutlet weak var headlineImageView: UIImageView!
    
    @IBOutlet weak var headlineTitleLabel: UILabel!
    
    @IBOutlet weak var bylineLabel: UILabel!
    
    
    // add a corner radius on a view. to do that we need to access the layer.cornerRadius property
    // override the layoutSubviews() method
    // layoutSubviews() gets called when the constraints and the view is getting presented in it superview.
    
    override func layoutSubviews() {
       
        
        //change the corner radius of the imageView's layer
        headlineImageView.layer.cornerRadius = 4
    }
    
    func configureCell(for headline: NewsHeadline) {
        headlineTitleLabel.text = headline.title
        bylineLabel.text = headline.byline
    }
}
