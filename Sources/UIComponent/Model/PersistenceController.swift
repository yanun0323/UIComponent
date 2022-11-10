import CoreData

@available(macOS 12.0, iOS 15, *)
public struct PersistenceController {
    /**
     Default persistence controller for database named "database". (all lowercase)
     */
    static private var shared = PersistenceController(name: "database")
    private let container: NSPersistentContainer
    private init(name: String, inMemory: Bool = false) {
        container = NSPersistentContainer(name: name)
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}

@available(macOS 12.0, *)
extension PersistenceController {
    /**
      The view context of shared.
     */
    public static var context: NSManagedObjectContext {
        return shared.container.viewContext
    }
}
