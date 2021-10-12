
import UIKit
import Foundation

class FavoritePokemonController:UITableViewController {
    private let cellId = "cellId"
    private let searchController = UISearchController(searchResultsController: nil)
    private var favoritePokemons = [PokemonModel]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.register(FavoritePokemonCell.self, forCellReuseIdentifier: cellId)
        tableView.backgroundColor = .white
        navigationItem.title = "Favorite Pokemon"
        self.favoritePokemons = UserDefaultsRepository.loadFromUserDefaults()
    }
}

extension FavoritePokemonController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritePokemons.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! FavoritePokemonCell
        cell.pokemon = favoritePokemons[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height / 6
    }
}


