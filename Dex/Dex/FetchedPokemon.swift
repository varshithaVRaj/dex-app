//
//  FetchedPokemon.swift
//  Dex
//
//  Created by Varshitha VRaj on 01/09/25.
//

import Foundation

    struct FetchedPokemon: Codable, Identifiable {
        let id: Int
        let name: String
        let baseExperience: Int
        let height: Int
        let order: Int
        let isDefault: Bool
        let abilities: [AbilityEntry]
        let forms: [NamedAPIResource]
        let gameIndices: [GameIndex]
        let heldItems: [HeldItem]
        let moves: [MoveEntry]
        let species: NamedAPIResource
        let sprites: Sprites
        let cries: Cries
        
        enum CodingKeys: String, CodingKey {
            case id, name, height, order, abilities, forms, species, sprites, cries, moves
            case baseExperience = "base_experience"
            case isDefault = "is_default"
            case gameIndices = "game_indices"
            case heldItems = "held_items"
        }
    }

    // MARK: - Ability
    struct AbilityEntry: Codable {
        let ability: NamedAPIResource
        let isHidden: Bool
        let slot: Int
        
        enum CodingKeys: String, CodingKey {
            case ability, slot
            case isHidden = "is_hidden"
        }
    }

    // MARK: - Move
    struct MoveEntry: Codable {
        let move: NamedAPIResource
        let versionGroupDetails: [VersionGroupDetail]
        
        enum CodingKeys: String, CodingKey {
            case move
            case versionGroupDetails = "version_group_details"
        }
    }

    struct VersionGroupDetail: Codable {
        let levelLearnedAt: Int
        let moveLearnMethod: NamedAPIResource
        let versionGroup: NamedAPIResource
        
        enum CodingKeys: String, CodingKey {
            case levelLearnedAt = "level_learned_at"
            case moveLearnMethod = "move_learn_method"
            case versionGroup = "version_group"
        }
    }

    // MARK: - Held Item
    struct HeldItem: Codable {
        let item: NamedAPIResource
        let versionDetails: [VersionDetail]
        
        enum CodingKeys: String, CodingKey {
            case item
            case versionDetails = "version_details"
        }
    }

    struct VersionDetail: Codable {
        let rarity: Int
        let version: NamedAPIResource
    }

    // MARK: - Game Index
    struct GameIndex: Codable {
        let gameIndex: Int
        let version: NamedAPIResource
        
        enum CodingKeys: String, CodingKey {
            case gameIndex = "game_index"
            case version
        }
    }

    // MARK: - Sprites
    struct Sprites: Codable {
        let frontDefault: String?
        let backDefault: String?
        let frontShiny: String?
        let backShiny: String?
        let other: OtherSprites?
        
        enum CodingKeys: String, CodingKey {
            case frontDefault = "front_default"
            case backDefault = "back_default"
            case frontShiny = "front_shiny"
            case backShiny = "back_shiny"
            case other
        }
    }

    struct OtherSprites: Codable {
        let dreamWorld: DreamWorld?
        let home: Home?
        let officialArtwork: OfficialArtwork?
        
        enum CodingKeys: String, CodingKey {
            case dreamWorld = "dream_world"
            case home
            case officialArtwork = "official-artwork"
        }
    }

    struct DreamWorld: Codable {
        let frontDefault: String?
    }

    struct Home: Codable {
        let frontDefault: String?
        let frontShiny: String?
    }

    struct OfficialArtwork: Codable {
        let frontDefault: String?
        let frontShiny: String?
    }

    // MARK: - Cries
    struct Cries: Codable {
        let latest: String
        let legacy: String
    }

    // MARK: - Named API Resource
    struct NamedAPIResource: Codable {
        let name: String
        let url: String
    }
