import Foundation
import UIKit
import SDWebImage
protocol PokemonSaveDelegate:AnyObject {
    func addPokemon(cell:PokemonCell)
}
class PokemonCell:UICollectionViewCell {
    
    var pokemon:PokemonModel? {
        didSet {
            configureCell()
        }
    }
    
    private let pokemonImage:UIImageView = {
        let iv = UIImageView()
        iv.layer.borderColor = UIColor.systemPink.cgColor
        iv.layer.borderWidth = 3
        iv.layer.masksToBounds = true
        iv.layer.cornerRadius = 30
        iv.layer.masksToBounds = true
        return iv
    }()
    private let pokemonNameLabel:UILabel = {
        let label = UILabel()
        label.text = "ピカチュウ"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    private let pokemonNumberLabel:UILabel = {
        let label = UILabel()
        label.text = "図鑑番号〇〇"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    private let borderView:UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    private let addPokemonButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemPink
        button.setTitle("お気に入りへ追加", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        button.addTarget(self, action: #selector(handleSave), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    weak var delegate:PokemonSaveDelegate?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
       
        let stack = UIStackView(arrangedSubviews: [pokemonNumberLabel,pokemonNameLabel])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 5
        addSubview(pokemonImage)
        addSubview(stack)
        addSubview(borderView)
        addSubview(addPokemonButton)
        pokemonImage.anchor(left:self.leftAnchor,paddingLeft:15,centerY:self.centerYAnchor,width:60, height:60)
        stack.anchor(left:pokemonImage.rightAnchor,paddingLeft: 10,centerY: self.centerYAnchor)
        borderView.anchor(bottom:self.bottomAnchor,paddingBottom: 0,width: self.frame.width,height: 2)
        addPokemonButton.anchor(right:self.rightAnchor,paddingRight:20,centerY:self.centerYAnchor,width:80,height:40)
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    @objc private func handleSave() {
        print(#function)
        self.delegate?.addPokemon(cell: self)
    }
    private func configureCell() {
        guard let pokemon = pokemon else {
            return
        }
        pokemonNameLabel.text = pokemon.name
        guard let url = URL(string: pokemon.urlImage) else { return }
        pokemonImage.sd_setImage(with: url, completed: nil)
        pokemonNumberLabel.text = "図鑑番号 \(pokemon.id)"
    }
}
