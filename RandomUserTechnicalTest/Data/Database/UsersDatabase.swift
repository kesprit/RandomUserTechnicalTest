//
//  UsersDatabase.swift
//  RandomUserTechnicalTest
//
//  Created by Kévin Esprit on 07/03/2022.
//

import Foundation
import GRDB

struct UsersDatabase {
    let dbWriter: DatabaseWriter
    private let migrator: DatabaseMigrator
    
    init(databaseName: String, migrator: DatabaseMigrator) throws {
        self.dbWriter = try DatabaseQueue.make(for: databaseName)
        self.migrator = migrator
        try migrator.migrate(dbWriter)
    }
}

extension UsersDatabase {
    static var current: Self {
        try! .init(databaseName: "db.sqlite", migrator: .creationMigrator)
    }
}

extension DatabaseQueue {
    static func make(for databaseName: String) throws -> DatabaseQueue {
        let fileManager = FileManager()
        let folderURL = try fileManager
            .url(for: .applicationSupportDirectory,
                    in: .userDomainMask,
                    appropriateFor: nil,
                    create: true)
            .appendingPathComponent("database", isDirectory: true)
        
        try fileManager.createDirectory(at: folderURL, withIntermediateDirectories: true)
        let dbURL = folderURL.appendingPathComponent(databaseName)
        let dbPool = try DatabaseQueue(path: dbURL.path)
        
        return dbPool
    }
}

extension DatabaseMigrator {
    static var creationMigrator: Self {
        var migrator = DatabaseMigrator()
        
        migrator.registerMigration("databaseCreation") { db in
            try db.create(table: "user", body: { table in
                table.autoIncrementedPrimaryKey("id")
                table.column("firstname", .text).notNull()
                table.column("lastname", .text).notNull()
                table.column("email", .text).notNull()
                table.column("gender", .text).notNull()
                table.column("age", .integer).notNull()
                table.column("birthday", .date).notNull()
                table.column("streetNumber", .integer).notNull()
                table.column("streetName", .text).notNull()
                table.column("city", .text).notNull()
                table.column("state", .text).notNull()
                table.column("pictureStringUrl", .text).notNull()
            })
        }
        
        return migrator
    }
}

