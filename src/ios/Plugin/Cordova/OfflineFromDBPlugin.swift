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
        guard let bookID = arg["bookId"] as? String else { return }
        guard let bibleId = arg["bibleId"] as? String else { return }
        guard let chapterNumber = arg["chapterNumber"] as? Int else { return }
        let json = BibleDataManager.shared.getVerses(bookId: bookID, bibleId: bibleId, chapterNumber: chapterNumber)
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: json)
        self.commandDelegate!.send(pluginResult,callbackId: command.callbackId)
    }

    @objc(getBookTeaching:) func getBookTeaching(command: CDVInvokedUrlCommand) {
        print("command.arguments : \(command.arguments)")
        guard let arg = command.arguments.first as? [String:Any] else { return }
        guard let bookID = arg["book_id"] as? String else { return }
        let json = BibleDataManager.shared.getBookTeaching(bookId: bookID)
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: json)
        self.commandDelegate!.send(pluginResult,callbackId: command.callbackId)
    }

    @objc(getTeachings:) func getTeachings(command: CDVInvokedUrlCommand) {
        print("command.arguments : \(command.arguments)")
        guard let arg = command.arguments.first as? [String:Any] else { return }
        guard let bibleBook = arg["bible_book"] as? String else { return }
        let json = BibleDataManager.shared.getTeachings(bookId: bibleBook)
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: json)
        self.commandDelegate!.send(pluginResult,callbackId: command.callbackId)
    }

    @objc(getTeaching:) func getTeaching(command: CDVInvokedUrlCommand) {
        print("command.arguments : \(command.arguments)")
        guard let arg = command.arguments.first as? [String:Any] else { return }
        guard let bookID = arg["book_id"] as? String else { return }
        guard let teachingUUID = arg["teaching_uuid"] as? String else { return }
        let json = BibleDataManager.shared.getTeaching(bookId: bookID, teachingUUID: teachingUUID)
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: json)
        self.commandDelegate!.send(pluginResult,callbackId: command.callbackId)
    }
    
    @objc(getTotalDownloads:) func getTotalDownloads(command: CDVInvokedUrlCommand) {
        print("command.arguments : \(command.arguments)")
        let json = BibleDataManager.shared.getTotalDownloads()
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: json)
        self.commandDelegate!.send(pluginResult,callbackId: command.callbackId)
    }

    @objc(getDownloadList:) func getDownloadList(command: CDVInvokedUrlCommand) {
        print("command.arguments : \(command.arguments)")
        guard let arg = command.arguments.first as? [String:Any] else { return }
        guard let bookID = arg["book_id"] as? String else { return }
        guard let fileType = arg["file_type"] as? String else { return }
        let json = BibleDataManager.shared.getDownloadList(bookId: bookID, fileType: fileType)
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: json)
        self.commandDelegate!.send(pluginResult,callbackId: command.callbackId)
    }

    @objc(getPercentage:) func getPercentage(command: CDVInvokedUrlCommand) {
        print("command.arguments : \(command.arguments)")
        guard let arg = command.arguments.first as? [String:Any] else { return }
        guard let bookID = arg["book_id"] as? String else { return }
        guard let fileType = arg["file_type"] as? String else { return }
        let json = BibleDataManager.shared.getPercentage(bookId: bookID, fileType: fileType)
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: json)
        self.commandDelegate!.send(pluginResult,callbackId: command.callbackId)
    }

    @objc(getBookPercentage:) func getBookPercentage(command: CDVInvokedUrlCommand) {
        print("command.arguments : \(command.arguments)")
        guard let arg = command.arguments.first as? [String:Any] else { return }
        guard let fileType = arg["file_type"] as? String else { return }
        let json = BibleDataManager.shared.getBookPercentage(fileType: fileType)
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: json)
        self.commandDelegate!.send(pluginResult,callbackId: command.callbackId)
    }

    @objc(updateDownload:) func updateDownload(command: CDVInvokedUrlCommand) {
        print("command.arguments : \(command.arguments)")
        guard let arg = command.arguments.first as? [String:Any] else { return }
        guard let fileName = arg["file_name"] as? String else { return }
        guard let localPath = arg["local_path"] as? String else { return }
        let json = BibleDataManager.shared.updateDownload(fileName: fileName, localPath: localPath)
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: json)
        self.commandDelegate!.send(pluginResult,callbackId: command.callbackId)
    }

    @objc(deleteDownloads:) func deleteDownloads(command: CDVInvokedUrlCommand) {
        print("command.arguments : \(command.arguments)")
        guard let arg = command.arguments.first as? [String:Any] else { return }
        guard let bookID = arg["book_id"] as? String else { return }
        guard let fileType = arg["file_type"] as? String else { return }
        let chapterDownloads = arg["chapterDownloads"] as? Bool ?? false
        let studyDownloads = arg["studyDownloads"] as? Bool ?? false
        let json = BibleDataManager.shared.deleteDownloads(bookId: bookID, fileType: fileType, chapterDownloads: chapterDownloads, studyDownloads: studyDownloads)
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: json)
        self.commandDelegate!.send(pluginResult,callbackId: command.callbackId)
    }

    @objc(delete:) func delete(command: CDVInvokedUrlCommand) {
        print("command.arguments : \(command.arguments)")
        guard let arg = command.arguments.first as? [String:Any] else { return }
        guard let bookID = arg["book_id"] as? String else { return }
        guard let fileType = arg["file_type"] as? String else { return }
        let chapterNumber = arg["chapter_number"] as? String ?? ""
        let uuid = arg["uuid"] as? String ?? ""
        let json = BibleDataManager.shared.delete(bookId: bookID, fileType: fileType, chapterNumber: chapterNumber, uuid: uuid)
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: json)
        self.commandDelegate!.send(pluginResult,callbackId: command.callbackId)
    }

    @objc(getBookDownloads:) func getBookDownloads(command: CDVInvokedUrlCommand) {
        print("command.arguments : \(command.arguments)")
        guard let arg = command.arguments.first as? [String:Any] else { return }
        guard let bookID = arg["book_id"] as? String else { return }
        let json = BibleDataManager.shared.getBookDownloads(bookId: bookID)
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: json)
        self.commandDelegate!.send(pluginResult,callbackId: command.callbackId)
    }
}
