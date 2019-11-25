//
//  ViewController.swift
//  TopStories
//
//  Created by Tiffany Obi on 11/25/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import UIKit

class NewsFeedController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    var headlines = [NewsHeadline]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    func loadData() {
        headlines = HeadlinesData.getHeadlines()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        loadData()
   
    }


}

extension NewsFeedController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        headlines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let storyCell = tableView.dequeueReusableCell(withIdentifier: "headlineCell", for: indexPath) as? HeadlineCellTableViewCell else {
            fatalError("couldnt dequeue a Headline Cell")
        }
        
        // get object (headline) at the current indexPath
        
        let headline = headlines[indexPath.row]
        
        storyCell.configureCell(for: headline)
        return storyCell
    }
    
    
}

extension NewsFeedController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}
