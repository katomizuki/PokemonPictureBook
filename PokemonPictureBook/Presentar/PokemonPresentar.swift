import Foundation
protocol PokemonPresentarInput:AnyObject {
    var numberOfPokemon:Int { get }
    var numberOfSavePokemon:Int { get }
    func didSelectTap(indexPath:IndexPath)
    func viewDidLoad()
    func pokemon(row:Int)->PokemonModel?
    func savePokemon(row:Int)->PokemonModel?
    func addPokemon(index:Int)
    func searchTextInput(text:String)
    func deleteFavorite(index:Int)
}
protocol PokemonPresentarOutput:AnyObject {
    func gotoPokemonDetail(pokemon:PokemonModel)
    func pokemonDataOutPut(pokemon:[PokemonModel])
    func filterPokemonOutput(pokemon:[PokemonModel])
}
protocol PokemonFavoritePresentarOutput:AnyObject {
    func deleteComplete()
}
class PokemonPresentar:PokemonPresentarInput {
    //Properties
    private var pokemons = [PokemonModel]()
    private weak var viewOutput:PokemonPresentarOutput!
    private var pokemonDataModel:GetPokemonDataInput
    private var savePokemons = UserDefaultsRepository.loadFromUserDefaults()
    private weak var favoriteOutput:PokemonFavoritePresentarOutput!
    
    var numberOfPokemon: Int {
        return pokemons.count
    }
    var numberOfSavePokemon:Int {
        return savePokemons.count
    }
    
    //Mark initialize
    init(viewOutput:PokemonPresentarOutput,modelInput:GetPokemonDataInput) {
        self.viewOutput = viewOutput
        self.pokemonDataModel = modelInput
    }
    
    init(favoriteViewOutput:PokemonFavoritePresentarOutput,modelInput:GetPokemonDataInput) {
        self.favoriteOutput = favoriteViewOutput
        self.pokemonDataModel = modelInput
    }
    
    //Mark inputMethod
    func viewDidLoad() {
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
        self.savePokemons =  UserDefaultsRepository.loadFromUserDefaults()
        self.savePokemons.append(pokemons[index])
        UserDefaultsRepository.saveToUserDefaults(pokemon: savePokemons)
    }
   
    func pokemon(row:Int)->PokemonModel? {
        print(#function)
        return  row >= pokemons.count ? nil : pokemons[row]
    }
    func savePokemon(row:Int)->PokemonModel? {
        print(#function)
        return row >= savePokemons.count ? nil : savePokemons[row]
    }
    
    func didSelectTap(indexPath:IndexPath) {
        print(#function)
        let pokemon = pokemons[indexPath.row]
        viewOutput.gotoPokemonDetail(pokemon: pokemon)
    }
    
    func searchTextInput(text: String) {
        print(#function)
        let filterPokemonArray = self.pokemons.filter { return $0.name.contains(text)}
        self.pokemons = filterPokemonArray
        viewOutput.filterPokemonOutput(pokemon: self.pokemons)
    }
    
    func deleteFavorite(index: Int) {
        self.savePokemons = UserDefaultsRepository.deleteFromUserDefaults(index: index, pokemons: savePokemons)
        favoriteOutput.deleteComplete()
    }
}
