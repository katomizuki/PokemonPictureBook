import Foundation
protocol PokemonPresentarInput:AnyObject {
    var numberOfPokemon:Int { get }
    func didSelectTap(indexPath:IndexPath)
    func viewDidLoad()
    func pokemon(row:Int)->PokemonModel?
    func addPokemon(index:Int)
}
protocol PokemonPresentarOutput:AnyObject {
    func gotoPokemonDetail(pokemon:PokemonModel)
    func pokemonDataOutPut(pokemon:[PokemonModel])
}
class PokemonPresentar:PokemonPresentarInput {
   
    private var pokemons = [PokemonModel]()
    private weak var viewOutput:PokemonPresentarOutput!
    private var pokemonDataModel:GetPokemonDataInput
    private var savePokemons = [PokemonModel]()
    
    var numberOfPokemon: Int {
        return pokemons.count
    }
    
    init(viewOutput:PokemonPresentarOutput,modelInput:GetPokemonDataInput) {
        self.viewOutput = viewOutput
        self.pokemonDataModel = modelInput
    }
    
    func viewDidLoad() {
        //データを取ってくる
        print(#function)
        pokemonDataModel.fetchPokemon { [weak self] pokemons in
            guard let self = self else { return }
            let pokemonArray = pokemons.sorted(by: { $0.id < $1.id })
            self.pokemons = pokemonArray
            self.viewOutput.pokemonDataOutPut(pokemon: self.pokemons)
        }
    }
    func addPokemon(index: Int) {
        print(#function)
        //Userdefaultで保存する
        savePokemons.append(pokemons[index])
        UserDefaultsRepository.saveToUserDefaults(pokemon: savePokemons)
    }
   
    
    func pokemon(row:Int)->PokemonModel? {
        print(#function)
        return  row >= pokemons.count ? nil:pokemons[row]
    }
    
    func didSelectTap(indexPath:IndexPath) {
        print(#function)
        let pokemon = pokemons[indexPath.row]
        viewOutput.gotoPokemonDetail(pokemon: pokemon)
    }
    
    
    func didFavoriteTap() {
        print(#function)
    }
    
    
}
