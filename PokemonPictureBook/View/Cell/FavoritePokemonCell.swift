import Foundation
import UIKit
class FavoritePokemonCell:UITableViewCell {
    
    private let pokemonImage:UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .systemOrange
        iv.layer.cornerRadius = 30
        iv.layer.masksToBounds = true
        return iv
    }()
    
    private let pokemoNameLabel:UILabel = {
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
    private let button:UIButton = {
        let button = UIButton()
        button.setTitle("解除", for: .normal)
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        backgroundColor = .white
    }
    
    func setupUI() {
        addSubview(pokemonImage)
        let stackView = UIStackView(arrangedSubviews: [pokemonNumberLabel,pokemoNameLabel,pokemonTypeLabel,pokemonKindLabel])
        stackView.axis = .vertical
        stackView.spacing = 5
        addSubview(stackView)
        addSubview(button)
        pokemonImage.anchor(left:leftAnchor,paddingLeft: 15,centerY:self.centerYAnchor,width: 60,height: 60)
        stackView.anchor(left:pokemonImage.rightAnchor,paddingLeft: 15,centerY: centerYAnchor)
        button.anchor(right:rightAnchor,paddingRight: 20,centerY: centerYAnchor,width: 70,height: 50)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
