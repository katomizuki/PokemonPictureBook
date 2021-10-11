
import UIKit
import Foundation

class FavoritePokemonController:UITableViewController {
    private let cellId = "cellId"
    private let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.register(FavoritePokemonCell.self, forCellReuseIdentifier: cellId)
        tableView.backgroundColor = .white
        navigationItem.title = "Favorite Pokemon"
    }
    
    
}

extension FavoritePokemonController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! FavoritePokemonCell
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height / 6
    }
}


