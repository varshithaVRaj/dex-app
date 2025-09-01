//
//  Persistence.swift
//  Dex
//
//  Created by Varshitha VRaj on 31/08/25.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    @MainActor
    static let preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        let newPokeMon = Pokemon(context: viewContext)
        
        newPokeMon.id = 1
        newPokeMon.name = "bulbasaur"
        newPokeMon.types = ["Grass", "Poison"]
        newPokeMon.hp = 45
        newPokeMon.attack = 49
        newPokeMon.defense = 49
        newPokeMon.specialAttack = 65
        newPokeMon.specialDefense = 65
        newPokeMon.speed = 45
        newPokeMon.sprite = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/132.png")
        newPokeMon.shiny = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/132.png")
        
        do {
            try viewContext.save()
        } catch {
//            let nsError = error as NSError
//            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            print("error in core data model: \(error)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Dex")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//            if let error = error as NSError? {
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
            print("error in persistant controller:- \(String(describing: error))")
        })
        container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
