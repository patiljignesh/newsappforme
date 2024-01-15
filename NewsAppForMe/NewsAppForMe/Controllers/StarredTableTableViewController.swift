//
//  StarredTableTableViewController.swift
//  NewsAppForMe
//
//  Created by Jigneshkumar Patil on 2024/01/15.
//

import UIKit
import FirebaseFirestore


class StarredTableTableViewController: UITableViewController {

    var favoriteArticles: [ArticleDetailViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupRefreshControl()
        fetchFavorites()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "FavoriteArticleCell")
        
    }

    private func setupRefreshControl() {
            refreshControl = UIRefreshControl()
            refreshControl?.addTarget(self, action: #selector(refreshFavorites(_:)), for: .valueChanged)
            refreshControl?.attributedTitle = NSAttributedString(string: "Pull to refresh")
        }

        @objc private func refreshFavorites(_ sender: Any) {
            fetchFavorites()
        }
    
    private func fetchFavorites() {
        FirebaseManager.shared.fetchFavoriteArticles { [weak self] (articles, error) in
            DispatchQueue.main.async {
                self?.refreshControl?.endRefreshing() // End refreshing
                if let articles = articles {
                    self?.favoriteArticles = articles
                    self?.tableView.reloadData()
                } else if let error = error {
                    print("Error fetching favorites: \(error)")
                }
            }
        }
    }
}

// MARK: - Table view data source

extension StarredTableTableViewController {
            
    private func setup(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
        
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteArticles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteArticleCell", for: indexPath)

        let articleViewModel = favoriteArticles[indexPath.row]
        cell.textLabel?.text = articleViewModel.title
        // Set other cell properties
        return cell
    }
    

    
    
}
