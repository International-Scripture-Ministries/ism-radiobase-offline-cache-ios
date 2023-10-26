//
//  OfflineFromDBPlugin.swift
//  OfflineFromDBDemo
//
//  Created by fahid
//

import Foundation
import UIKit
import Foundation

@objc(OfflineFromDBPlugin) class OfflineFromDBPlugin: CDVPlugin {

    // MARK: Properties

    var pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR)

    //This method is called when the plugin is initialized; plugin setup methods got here
    override func pluginInitialize() { }

    @objc(initOfflineFromDBPlugin:) func initOfflineFromDBPlugin(command: CDVInvokedUrlCommand) {
        BibleDataManager.shared.setupPrepopulatedDB()
    }

    @objc(getAllBooks:) func getAllBooks(command: CDVInvokedUrlCommand) {
        let json = BibleDataManager.shared.getAllBooks()
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: json)
        self.commandDelegate!.send(pluginResult,callbackId: command.callbackId)
    }

    @objc(getVerses:) func getVerses(command: CDVInvokedUrlCommand) {
        print("command.arguments : \(command.arguments)")
        guard let arg = command.arguments.first as? [String:Any] else { return }
        guard let bookID = arg["bookID"] as? String else { return }
        guard let bibleId = arg["bibleId"] as? String else { return }
        guard let chapterNumber = arg["chapterNumber"] as? Int else { return }
        let json = BibleDataManager.shared.getVerses(bookId: bookID, bibleId: bibleId, chapterNumber: chapterNumber)
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: json)
        self.commandDelegate!.send(pluginResult,callbackId: command.callbackId)
    }

    @objc(getBookTeaching:) func getBookTeaching(command: CDVInvokedUrlCommand) {
        print("command.arguments : \(command.arguments)")
        guard let arg = command.arguments.first as? [String:Any] else { return }
        guard let bookID = arg["bookID"] as? String else { return }
        let json = BibleDataManager.shared.getBookTeaching(bookId: bookID)
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: json)
        self.commandDelegate!.send(pluginResult,callbackId: command.callbackId)
    }

    @objc(getTeachings:) func getTeachings(command: CDVInvokedUrlCommand) {
        print("command.arguments : \(command.arguments)")
        guard let arg = command.arguments.first as? [String:Any] else { return }
        guard let bibleBook = arg["bibleBook"] as? String else { return }
        guard let chapterNumber = arg["chapterNumber"] as? Int else { return }
        guard let verseNumber = arg["verseNumber"] as? String else { return }
        let json = BibleDataManager.shared.getTeachings(bibleBook: bibleBook, chapterNumber: chapterNumber, verseNumber: verseNumber)
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: json)
        self.commandDelegate!.send(pluginResult,callbackId: command.callbackId)
    }

    @objc(getTeaching:) func getTeaching(command: CDVInvokedUrlCommand) {
        print("command.arguments : \(command.arguments)")
        guard let arg = command.arguments.first as? [String:Any] else { return }
        guard let bookID = arg["bookID"] as? String else { return }
        guard let teachingUUID = arg["teachingUUID"] as? String else { return }
        let json = BibleDataManager.shared.getTeaching(bookId: bookID, teachingUUID: teachingUUID)
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: json)
        self.commandDelegate!.send(pluginResult,callbackId: command.callbackId)
    }
}
