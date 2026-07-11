import Foundation

// MARK: - MTGResponse
/// Struct principal que engloba a resposta inteira da API
struct MTGResponse: Codable {
    let cards: [Card]
}

// MARK: - Card
/// Modelo de dados representando uma carta individual
struct Card: Codable {
    let id: String
    let name: String
    let manaCost: String?
    let cmc: Double?
    let colors: [String]?
    let colorIdentity: [String]?
    let type: String?
    let types: [String]?
    let subtypes: [String]?
    let rarity: String?
    let set: String?
    let setName: String?
    let text: String?
    let flavor: String?
    let artist: String?
    let number: String?
    let power: String?
    let toughness: String?
    let layout: String?
    let multiverseid: String? // Nota: A API costuma retornar como String nas versões mais recentes
    let imageUrl: String?
    let printings: [String]?
    let rulings: [Ruling]?
    let legalities: [Legality]?
}

// MARK: - Ruling
/// Regras e clarificações associadas à carta
struct Ruling: Codable {
    let date: String
    let text: String
}

// MARK: - Legality
/// Informações de legalidade da carta nos diferentes formatos (Standard, Commander, Modern, etc)
struct Legality: Codable {
    let format: String
    let legality: String
}


func fetchMTGCards() {
    guard let url = URL(string: "https://api.magicthegathering.io/v1/cards") else { return }
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        // Verifica se houve erro
        if let error = error {
            print("Erro na requisição: \(error.localizedDescription)")
            return
        }
        
        // Verifica se recebemos dados
        guard let data = data else {
            print("Nenhum dado retornado.")
            return
        }
        
        // Tenta decodificar o JSON usando as Structs
        do {
            let decoder = JSONDecoder()
            let mtgResponse = try decoder.decode(MTGResponse.self, from: data)
            
            // Sucesso!
            let cards = mtgResponse.cards
            print("✅ Carregamento concluído: \(cards.count) cartas recebidas.")
            
            if let firstCard = cards.first {
                print("Exemplo - Primeira Carta: \(firstCard.name)")
                print("Custo de Mana: \(firstCard.manaCost ?? "Nenhum")")
                print("Imagem: \(firstCard.imageUrl ?? "Sem Imagem")")
            }
            
        } catch {
            print("❌ Erro ao decodificar o JSON: \(error)")
        }
    }
    
    task.resume()
}

func main() {
    // Chame a função para testar
    fetchMTGCards()
}
