//
//  NewsListTableViewController.swift
//  NewsAppForMe
//
//  Created by Jigneshkumar Patil on 2024/01/15.
//

import UIKit

class NewsListTableViewController: UITableViewController {

    private var newsArticleListViewModel: NewsArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRefreshControl()
        setup()
        fetchNewsArticles()
    }
}

extension NewsListTableViewController {
    
    private func setup(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.newsArticleListViewModel == nil ? 0 : self.newsArticleListViewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsArticleListViewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsArticleTableViewCell", for: indexPath) as? NewsArticleListTableViewCell else {
            fatalError("NewArticleTableViewCell not found")
        }
        
        let newsArticleViewModel = self.newsArticleListViewModel.newsArticleAtIndex(indexPath.row)
        cell.newsTitleLabel.text = newsArticleViewModel.title
        cell.newsDescriptionLabel.text = newsArticleViewModel.description
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let articleDetailViewModel = self.newsArticleListViewModel.newsArticleAtIndex(indexPath.row)
            navigateToDetailViewController(with: articleDetailViewModel)
            tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Navigation

    private func navigateToDetailViewController(with articleViewModel: ArticleDetailViewModel) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil) // Replace "Main" with your storyboard name if different
        if let detailVC = storyboard.instantiateViewController(withIdentifier: "ArticleDetailViewControllerID") as? ArticleDetailViewController {
            detailVC.articleViewModel = articleViewModel
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }

}

// MARK: - Refresh

extension NewsListTableViewController {

    private func setupRefreshControl() {
        // Add Refresh Control to Table View
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(refreshNewsData(_:)), for: .valueChanged)
        refreshControl?.attributedTitle = NSAttributedString(string: "Fetching News Articles...")
        tableView.refreshControl = refreshControl
        print("Fetching News Articles...")

    }
    
    @objc private func refreshNewsData(_ sender: Any) {
        print("Refreshing_News Data")
        // Fetch News Data
        fetchNewsArticles()
    }

    private func fetchNewsArticles() {
//        let url = URL(string: "https://newsapi.org/v2/top-headlines?apiKey=1d38baf2f91547a28752a9a255b59779&country=\(country ?? "us")")!
        let url = URL(string: "https://newsapi.org/v2/top-headlines?apiKey=1d38baf2f91547a28752a9a255b59779&country=za")!
        Webservices().getArticles(url: url) { newsArticles in
                DispatchQueue.main.async {
                    if let newsArticles = newsArticles {
                        self.newsArticleListViewModel = NewsArticleListViewModel(newsArticle: newsArticles)
                        self.tableView.reloadData()
                    }
                    self.refreshControl?.endRefreshing()
                }
        }
    }

}

