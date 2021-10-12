
import Foundation
import UIKit
protocol PokemonHeaderDelegate:AnyObject {
    func allFavoritePokemon()
}
class PokemonHeader:UICollectionReusableView{
    
    //Mark Properties
    private let titleLabel:UILabel = {
        let label = UILabel()
        label.text = "ポケモン図鑑"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .systemPink
        return label
    }()
    private let monsterBallImage:UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .systemOrange
        iv.image = UIImage(named: "monstar-ball")
        iv.contentMode = .scaleAspectFit
        iv.layer.cornerRadius = 40
        iv.layer.masksToBounds = true
        return iv
    }()
    
    private let favoriteButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemPink
        button.setTitle("お気に入りポケモン一覧", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleFavorite), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    weak var delegate:PokemonHeaderDelegate?
    
    //Mark initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(titleLabel)
        addSubview(monsterBallImage)
        addSubview(favoriteButton)
        monsterBallImage.anchor(left:self.leftAnchor,paddingLeft: 20,centerY: centerYAnchor,width: 80,height: 80)
        titleLabel.anchor(top:monsterBallImage.topAnchor,left:monsterBallImage.rightAnchor,paddingTop: 0,paddingLeft: 30)
        favoriteButton.anchor(top:titleLabel.topAnchor,left:monsterBallImage.rightAnchor,paddingTop: 30,paddingLeft: 30,width: 200,height: 40)
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    //Mark selector
    @objc private func handleFavorite() {
        print(#function)
        self.delegate?.allFavoritePokemon()
    }
}
