import UIKit
import Foundation

class FavoritePokemonController:UITableViewController {
    //Properties
    private let cellId = "cellId"
    private let searchController = UISearchController(searchResultsController: nil)
    private var pokemonPresentar:PokemonPresentarInput!
    //Mark lifecycle
    override func viewDidLoad() {
        setupTableView()
        pokemonPresentar = PokemonPresentar(favoriteViewOutput: self, modelInput: PokemonDataModel())
    }
    
    //Mark setupTableview
    private func setupTableView() {
        tableView.register(FavoritePokemonCell.self, forCellReuseIdentifier: cellId)
        tableView.backgroundColor = .white
        navigationItem.title = "Favorite Pokemon"
    }
}
//Mark tableViewDelegate
extension FavoritePokemonController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonPresentar.numberOfSavePokemon
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! FavoritePokemonCell
        cell.pokemon = pokemonPresentar.savePokemon(row: indexPath.row)
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height / 6
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        pokemonPresentar.deleteFavorite(index: indexPath.row)
    }
}
//Mark PokemonFavoritePresentarOutput
extension FavoritePokemonController: PokemonFavoritePresentarOutput {
    func deleteComplete() {
        print(#function)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}


