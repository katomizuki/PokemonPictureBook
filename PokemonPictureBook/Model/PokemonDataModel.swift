import Foundation
import Alamofire

protocol GetPokemonDataInput {
    func fetchPokemon(completion:@escaping([PokemonModel])->Void)
}
class PokemonDataModel:GetPokemonDataInput {
    
    func fetchPokemon(completion:@escaping([PokemonModel])->Void) {
        var pokemonArray = [PokemonModel]()
        let dispatchGroup = DispatchGroup()
        for i in 1...151 {
            dispatchGroup.enter()
            let pokemonURL = "https://pokeapi.co/api/v2/pokemon-species/\(i)"
            let pokemonDetailURL = "https://pokeapi.co/api/v2/pokemon/\(i)"
            AF.request(pokemonURL).responseJSON { response in
                switch response.result {
                case .success:
                    do {
                        guard let safeData = response.data else { return }
                        let data = try JSONDecoder().decode(PokemonData.self,from:safeData)
                        let name = data.names[0].name
                        let id = data.id
                        let genera = data.genera[0].genus
                        let explain = data.flavor_text_entries[29].flavor_text
                        let explain2 = data.flavor_text_entries[37].flavor_text
                        let explain3 = data.flavor_text_entries[38].flavor_text
                        AF.request(pokemonDetailURL).responseJSON { response in
                            switch response.result {
                            case .success:
                                do {
                                    defer { dispatchGroup.leave() }
                                    let data = try JSONDecoder().decode(PokemonDetail.self, from: response.data!)
                                    let height = data.height
                                    let weight = data.weight
                                    let imageUrl = data.sprites.front_default
                                    let type = data.types[0].type.name
                                    let pokemon = PokemonModel(name: name, id: id, genus: genera, explain: explain, explain2: explain2, explain3: explain3, height: height, weight: weight, urlImage: imageUrl,type:type)
                                    pokemonArray.append(pokemon)
                                } catch {
                                    print(error)
                                }
                            case .failure(let error):
                                print(error)
                            }
                        }
                    } catch {
                        print(error)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
        dispatchGroup.notify(queue: .main) {
            completion(pokemonArray)
        }
    }
}
