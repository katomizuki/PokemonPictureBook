import Foundation
import UIKit
class FavoritePokemonCell:UITableViewCell {
    
    private let pokemonImage:UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .systemOrange
        return iv
    }()
    
    private let pokemoNameLabel:UILabel = {
        let label = UILabel()
        label.text = "ピカちゅう"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
