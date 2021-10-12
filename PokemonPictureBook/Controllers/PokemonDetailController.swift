import UIKit
import Foundation
import SDWebImage

class PokemonDetailController:UIViewController {
    
    private let pokemonImage:UIImageView = {
        let iv = UIImageView()
        iv.layer.borderColor = UIColor.systemPink.cgColor
        iv.layer.borderWidth = 2
        iv.layer.cornerRadius = 50
        iv.layer.masksToBounds = true
        return iv
    }()
    private let pokemonNameLabel:UILabel = {
        let label = UILabel()
        label.text = "フシギダネ"
        label.textAlignment = .center
        return label
    }()
    private let pokemonNumberLabel:UILabel = {
        let label = UILabel()
        label.text = "No'1"
        label.textAlignment = .center
        return label
    }()
    private let pokemonHeightLabel:UILabel = {
        let label = UILabel()
        label.text = "高さ 0.7m"
        label.textAlignment = .center
        return label
    }()
    private let pokemonWeigthLabel:UILabel = {
        let label = UILabel()
        label.text = "おもさ 6.9kg"
        label.textAlignment = .center
        return label
    }()
    private let pokemonTypeLabel:UILabel = {
        let label = UILabel()
        label.text = "くさタイプ"
        label.textAlignment = .center
        return label
    }()
    private let pokemonKindLabel:UILabel = {
        let label = UILabel()
        label.text = "たねポケモン"
        label.textAlignment = .center
        return label
    }()
    private let explainTextView:UITextView = {
        let textView = UITextView()
        textView.text = "生まれたときから　背中に 不思議な　タネが　植えてあって 体と　ともに　育つという。"
        textView.backgroundColor = .white
        textView.isEditable = false
        textView.isSelectable = false
        textView.textAlignment = .center
        return textView
    }()
    private let explainTextView2:UITextView = {
        let textView = UITextView()
        textView.text = "生まれたときから　背中に 不思議な　タネが　植えてあって 体と　ともに　育つという。"
        textView.backgroundColor = .white
        textView.isEditable = false
        textView.isSelectable = false
        textView.textAlignment = .center
        return textView
    }()
    private let explainTextView3:UITextView = {
        let textView = UITextView()
        textView.text = "生まれたときから　背中に 不思議な　タネが　植えてあって 体と　ともに　育つという。"
        textView.backgroundColor = .white
        textView.isEditable = false
        textView.isSelectable = false
        textView.textAlignment = .center
        return textView
    }()
    
    override func viewDidLoad() {
        setupUI()
        updateUI()
    }
    private var pokemon:PokemonModel
    init(pokemon:PokemonModel) {
        self.pokemon = pokemon
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        let stackView = UIStackView(arrangedSubviews: [pokemonNameLabel,pokemonTypeLabel,pokemonKindLabel,pokemonHeightLabel,pokemonWeigthLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        let explainStack = UIStackView(arrangedSubviews: [explainTextView,explainTextView2,explainTextView3])
        explainStack.axis = .vertical
        explainStack.spacing = 5
        explainStack.distribution = .fillEqually
        view.addSubview(pokemonImage)
        view.addSubview(pokemonNumberLabel)
        view.addSubview(stackView)
        view.addSubview(explainStack)
        pokemonNumberLabel.anchor(top:view.safeAreaLayoutGuide.topAnchor,left:view.leftAnchor,right: view.rightAnchor,paddingTop: 30,paddingRight: 30,paddingLeft: 30,centerX: view.centerXAnchor,height: 30)
        pokemonImage.anchor(top:pokemonNumberLabel.bottomAnchor,paddingTop: 10,centerX: view.centerXAnchor,width: 100,height: 100)
        stackView.anchor(top:pokemonImage.bottomAnchor,centerX: view.centerXAnchor,width: view.frame.width - 30,height: 150)
        explainStack.anchor(top:stackView.bottomAnchor,paddingTop: 10,centerX: view.centerXAnchor,width:view.frame.width - 30,height: 200)
    }
    
    private func updateUI() {
        pokemonNumberLabel.text = "図鑑番号　\(pokemon.id)"
        pokemonNameLabel.text = pokemon.name
        guard let url = URL(string: pokemon.urlImage) else { return }
        pokemonImage.sd_setImage(with: url, completed: nil)
        pokemonKindLabel.text = pokemon.genus
        pokemonHeightLabel.text = "身長　\(pokemon.height * 10) cm"
        pokemonWeigthLabel.text = "体重 \(Double(pokemon.weight) / 10) kg"
        explainTextView.text = "\(pokemon.explain)"
        explainTextView2.text = "\(pokemon.explain2)"
        explainTextView3.text = "\(pokemon.explain3)"
        pokemonTypeLabel.text = TypeUtil.changeType(type: pokemon.type)
    }
}
