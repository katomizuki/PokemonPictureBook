import Foundation
import UIKit
import SDWebImage
class FavoritePokemonCell:UITableViewCell {
    
    private let pokemonImage:UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .systemOrange
        iv.layer.cornerRadius = 30
        iv.layer.masksToBounds = true
        return iv
    }()
    
    private let pokemonNameLabel:UILabel = {
        let label = UILabel()
        label.text = "ピカちゅう"
        return label
    }()
    private let pokemonTypeLabel:UILabel = {
        let label = UILabel()
        label.text = "みずタイプ"
        return label
    }()
    private let pokemonKindLabel:UILabel = {
        let label = UILabel()
        label.text = "ネズミポケモン"
        return label
    }()
    private let pokemonNumberLabel:UILabel = {
        let label = UILabel()
        label.text = "No'1"
        return label
    }()
    var pokemon:PokemonModel? {
        didSet {
            configure()
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        backgroundColor = .white
    }
    
    func setupUI() {
        addSubview(pokemonImage)
        let stackView = UIStackView(arrangedSubviews: [pokemonNumberLabel,pokemonNameLabel,pokemonTypeLabel,pokemonKindLabel])
        stackView.axis = .vertical
        stackView.spacing = 5
        addSubview(stackView)
        pokemonImage.anchor(left:leftAnchor,paddingLeft: 15,centerY:self.centerYAnchor,width: 60,height: 60)
        stackView.anchor(left:pokemonImage.rightAnchor,paddingLeft: 15,centerY: centerYAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    private func configure() {
        guard let pokemon = pokemon else { return }
        pokemonNumberLabel.text = "図鑑番号　\(pokemon.id)"
        pokemonNameLabel.text = pokemon.name
        guard let url = URL(string: pokemon.urlImage) else { return }
        pokemonImage.sd_setImage(with: url, completed: nil)
        pokemonKindLabel.text = pokemon.genus
        pokemonTypeLabel.text = TypeUtil.changeType(type: pokemon.type)
    }
}
