
import Foundation
import UIKit
protocol PokemonSaveDelegate:AnyObject {
    func addPokemon()
}
class PokemonCell:UICollectionViewCell {
    
    private let pokemonImage:UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .systemPink
        iv.layer.cornerRadius = 20
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
        pokemonImage.anchor(left:self.leftAnchor,paddingLeft:15,centerY:self.centerYAnchor,width:40, height:40)
        stack.anchor(left:pokemonImage.rightAnchor,paddingLeft: 10,centerY: self.centerYAnchor)
        borderView.anchor(bottom:self.bottomAnchor,paddingBottom: 0,width: self.frame.width,height: 2)
        addPokemonButton.anchor(right:self.rightAnchor,paddingRight:20,centerY:self.centerYAnchor,width:80,height:40)
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    @objc private func handleSave() {
        print(#function)
        self.delegate?.addPokemon()
    }
}
