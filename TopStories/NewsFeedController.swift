//
//  ViewController.swift
//  TopStories
//
//  Created by Tiffany Obi on 11/25/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import UIKit

enum SearchScope {
    case title // title of headline
    case abstract // summary of headline
}

class NewsFeedController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var headlines = [NewsHeadline]() {
        didSet { //property observer , observes changes on the variable and updates the tableView.
            tableView.reloadData()
        }
    }
    
    var currentScope = SearchScope.title // default value is 0 "title" scope
    
    
    var searchQuery = "" {
        didSet {
            switch currentScope {
            case .title:
                headlines = HeadlinesData.getHeadlines().filter { $0.title.lowercased().contains(searchQuery.lowercased()) }
            case .abstract:
                headlines = HeadlinesData.getHeadlines().filter { $0.abstract.lowercased().contains(searchQuery.lowercased()) }
            }
        }
    }
    
    
    func loadData() {
        headlines = HeadlinesData.getHeadlines()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        loadData()
   
    }

   /* func filterHeadlines(for searchText: String) {
        
        //guarding against empty search query!
        guard !searchText.isEmpty else {
            return
            //return here simply does nothing.
        }
        // filterHeadlines is considered a "helper function".
        
        headlines = HeadlinesData.getHeadlines().filter { $0.title.lowercased().contains(searchText.lowercased()) }
    } */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // get destination viewController by downcasting.
        //we need the index path the user selected.
    guard let newsDetailController = segue.destination as? NewsDetailViewController ,
        let indexPath = tableView.indexPathForSelectedRow
        else {
            fatalError("verify class name in the \"indentify inspecter\" ")
        }
        // get selected headline
        let headline = headlines[indexPath.row]
        
        // set the newsDetailController
        newsDetailController.newsHeadline = headline
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



extension NewsFeedController: UISearchBarDelegate {
    
func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
       //dismiss keyboard
    searchBar.resignFirstResponder()

        }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //dismiss the keyboard,
        
        
        guard !searchText.isEmpty else {
            //searchBar is empty hereb so we have to get back all lof the of the original.
            //usuing our loadData method.
            loadData()
            return
        }
        print("searchText: \(searchText)")
        
        //Todo: real time updates of what the user is searching
        searchQuery = searchText
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        print("selectedScope: \(selectedScope)")
        
        switch selectedScope {
        case 0:
            currentScope = .title
            print(currentScope)
        case 1:
            currentScope = .abstract
            print(currentScope)
        default:
            print("not a valid search scope")
        }
    }
    
    }

