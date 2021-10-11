
import UIKit

class PokemonViewController: UICollectionViewController {
    private let cellId = "cellId"
    private let headerId = "headerId"
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    private func setupCollectionView() {
        collectionView.register(PokemonCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(PokemonHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    required init?(coder: NSCoder) {
        fatalError()
    }


}

extension PokemonViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PokemonCell
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
    }
}

extension PokemonViewController :UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 150)
    }
}

extension PokemonViewController:PokemonSaveDelegate {
    func addPokemon() {
        print(#function)
        let vc = PokemonDetailController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
extension PokemonViewController:PokemonHeaderDelegate {
    func allFavoritePokemon() {
        print(#function)
    }
}
