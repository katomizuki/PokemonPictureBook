import UIKit

class PokemonViewController: UICollectionViewController{
    //Properties
    private let cellId = "cellId"
    private let headerId = "headerId"
    private var pokemonPresentar:PokemonPresentarInput!
    private var indicatorView = UIActivityIndicatorView()
    private var searchController = UISearchController()
    //Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        pokemonPresentar = PokemonPresentar(viewOutput: self, modelInput: PokemonDataModel())
        pokemonPresentar.viewDidLoad()
        setupSeachController()
    }
    //Mark setupMethod
    private func setupCollectionView() {
        collectionView.register(PokemonCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(PokemonHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        indicatorView.center = view.center
        indicatorView.style = .whiteLarge
        indicatorView.color = .gray
        view.addSubview(indicatorView)
        indicatorView.startAnimating()
    }
    //Initialize
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //setupMethod
    private func setupSeachController() {
        navigationItem.title = "Pokemon Picture Book"
        //インスタンス
        searchController = UISearchController(searchResultsController: nil)
        //Delegateメソッドを設定
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        //itemに入れる
        navigationItem.searchController = searchController
        //隠れるようにする
        navigationItem.hidesSearchBarWhenScrolling = true
    }
}
//Mark collectionViewdelegate Method
extension PokemonViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonPresentar.numberOfPokemon
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PokemonCell
        guard let pokemon = pokemonPresentar.pokemon(row: indexPath.row) else { return cell}
        cell.pokemon = pokemon
        cell.delegate = self
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! PokemonHeader
        header.delegate = self
        return header
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function)
        pokemonPresentar.didSelectTap(indexPath: indexPath)
        
    }
}
//Mark collectionviewflowlayoutMethod
extension PokemonViewController :UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 150)
    }
}
//Mark PokemonSaveDelegate
extension PokemonViewController:PokemonSaveDelegate {
    func addPokemon(cell: PokemonCell) {
        print(#function)
        let indexTapped = collectionView.indexPath(for: cell)
        guard let index = indexTapped?[1] else { return }
        let vc = UIAlertController(title: "お気に入りに追加しますか", message: "", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "はい", style: .default) { _ in
            self.pokemonPresentar.addPokemon(index: index)
        }
        let cancleAction = UIAlertAction(title: "いいえ", style: .cancel) { _ in
            print("canle")
        }
        vc.addAction(alertAction)
        vc.addAction(cancleAction)
        present(vc, animated: true, completion: nil)
    }
}
//Mark PokemonHeaderDelegate
extension PokemonViewController:PokemonHeaderDelegate {
    func allFavoritePokemon() {
        print(#function)
        let vc = FavoritePokemonController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
//Mark PokemonPresarOutput
extension PokemonViewController :PokemonPresentarOutput {
    func filterPokemonOutput(pokemon: [PokemonModel]) {
        print(#function)
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func pokemonDataOutPut(pokemon: [PokemonModel]) {
        print(#function)
        DispatchQueue.main.async {
            self.indicatorView.stopAnimating()
            self.collectionView.reloadData()
        }
    }
    
    func gotoPokemonDetail(pokemon: PokemonModel) {
        print(#function)
        let vc = PokemonDetailController(pokemon: pokemon)
        navigationController?.pushViewController(vc, animated: true)
    }
}
//Mark searchResultUpdating
extension PokemonViewController:UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print(#function)
        guard let text = searchController.searchBar.text else { return }
        if !text.isEmpty {
            pokemonPresentar.searchTextInput(text: text)
        } else {
            pokemonPresentar.viewDidLoad()
        }
    }
}
