import UIKit
import Foundation

class PokemonDetailController:UIViewController {
    
    private let pokemonImage:UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .systemOrange
        iv.layer.cornerRadius = 40
        iv.layer.masksToBounds = true
        return iv
    }()
    private let pokemonNameLabel:UILabel = {
        let label = UILabel()
        label.text = "フシギダネ"
        return label
    }()
    private let pokemonNumberLabel:UILabel = {
        let label = UILabel()
        label.text = "No'1"
        return label
    }()
    private let pokemonHeightLabel:UILabel = {
        let label = UILabel()
        label.text = "高さ 0.7m"
        return label
    }()
    private let pokemonWeigthLabel:UILabel = {
        let label = UILabel()
        label.text = "おもさ 6.9kg"
        return label
    }()
    private let pokemonTypeLabel:UILabel = {
        let label = UILabel()
        label.text = "くさタイプ"
        return label
    }()
    private let pokemonKindLabel:UILabel = {
        let label = UILabel()
        label.text = "たねポケモン"
        return label
    }()
    private let explainTextView:UITextView = {
        let textView = UITextView()
        textView.text = "生まれたときから　背中に 不思議な　タネが　植えてあって 体と　ともに　育つという。"
        textView.backgroundColor = .red
        return textView
    }()
    private let explainTextView2:UITextView = {
        let textView = UITextView()
        textView.text = "生まれたときから　背中に 不思議な　タネが　植えてあって 体と　ともに　育つという。"
        textView.backgroundColor = .yellow
        return textView
    }()
    private let explainTextView3:UITextView = {
        let textView = UITextView()
        textView.text = "生まれたときから　背中に 不思議な　タネが　植えてあって 体と　ともに　育つという。"
        textView.backgroundColor = .blue
        return textView
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .systemPurple
        setupUI()
    }
    
    private func setupUI() {
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
        pokemonNumberLabel.anchor(top:view.safeAreaLayoutGuide.topAnchor,left:view.leftAnchor,right: view.rightAnchor,paddingRight: 30,paddingLeft: 30,centerX: view.centerXAnchor,height: 30)
        pokemonImage.anchor(top:pokemonNumberLabel.bottomAnchor,paddingTop: 10,centerX: view.centerXAnchor,width: 80,height: 80)
        stackView.anchor(top:pokemonImage.bottomAnchor,centerX: view.centerXAnchor,width: view.frame.width - 30,height: 150)
        explainStack.anchor(top:stackView.bottomAnchor,bottom:view.bottomAnchor,paddingTop: 10,paddingBottom: 20,centerX: view.centerXAnchor,width:view.frame.width - 30)
        
    }
    
}
