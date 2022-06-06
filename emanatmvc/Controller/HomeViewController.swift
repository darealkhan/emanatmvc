//
//  ViewController.swift
//  emanatmvc
//
//  Created by Ayxan Seferli on 06.06.22.
//

import UIKit

class HomeViewController: UIViewController {
    
    var quotes = [Quotes]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        fetchQuotes()
    }
    
    func fetchQuotes() {
        
        guard let url = URL(string: "https://dummyjson.com/quotes") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, err in
            if let err = err {
                print(err.localizedDescription)
            } else {
                
                guard let safeData = data else { return }
                
                do {
                    let decodedQuotes = try JSONDecoder().decode(Quote.self, from: safeData)
                    
                    self.quotes = decodedQuotes.quotes
                    
                    print(self.quotes)
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                } catch {
                    print(error.localizedDescription)
                }
                
            }
        }.resume()
        
    }
    
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        cell.configureCell(quoteModel: quotes[indexPath.row])
        
        return cell
    }
    
    
}

