import UIKit
import Foundation

class PokemonDetailController:UIViewController {
    
    private let pokemonImage:UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .systemOrange
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
        return textView
    }()
    private let explainTextView2:UITextView = {
        let textView = UITextView()
        textView.text = "生まれたときから　背中に 不思議な　タネが　植えてあって 体と　ともに　育つという。"
        return textView
    }()
    private let explainTextVie3:UITextView = {
        let textView = UITextView()
        textView.text = "生まれたときから　背中に 不思議な　タネが　植えてあって 体と　ともに　育つという。"
        return textView
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .systemPurple
    }
    
}
