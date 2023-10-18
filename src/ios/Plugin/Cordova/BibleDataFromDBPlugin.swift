//
//  BibleDataFromDBPlugin.swift
//  BibleDataFromDBDemo
//
//  Created by fahid on 12/04/2022.
//

import Foundation
import UIKit
import Foundation

@objc(BibleDataFromDBPlugin) class BibleDataFromDBPlugin: CDVPlugin {

    // MARK: Properties

    var pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR)

    //This method is called when the plugin is initialized; plugin setup methods got here
    override func pluginInitialize() { }

    @objc(initBibleDataFromDBPlugin:) func initBibleDataFromDBPlugin(command: CDVInvokedUrlCommand) {
        BibleDataManager.shared.configureDatabase()
    }

    @objc(getAllBooks:) func getAllBooks(command: CDVInvokedUrlCommand) {
        let json = BibleDataManager.shared.getAllBooks()
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: json)
        self.commandDelegate!.send(pluginResult,callbackId: command.callbackId)
    }

    @objc(getBibleData:) func getBibleData(command: CDVInvokedUrlCommand) {
        print("command.arguments : \(command.arguments)")
        guard let arg = command.arguments.first as? [String:Any] else { return }
        guard let bookID = arg["book_id"] as? String else { return }
        if bookID.isEmpty {
            print("bookID and teachingID can not be empty.")
            return
        }
        let json = BibleDataManager.shared.getBibleData(book_id: bookID)
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: json)
        self.commandDelegate!.send(pluginResult,callbackId: command.callbackId)
    }

    @objc(getBookTeaching:) func getBookTeaching(command: CDVInvokedUrlCommand) {
        print("command.arguments : \(command.arguments)")
        guard let arg = command.arguments.first as? [String:Any] else { return }
        guard let bookID = arg["book_id"] as? String else { return }
        if bookID.isEmpty {
            print("bookID and teachingID can not be empty.")
            return
        }
        let json = BibleDataManager.shared.getBookTeaching(book_id: bookID)
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: json)
        self.commandDelegate!.send(pluginResult,callbackId: command.callbackId)
    }

    @objc(getTeaching:) func getTeaching(command: CDVInvokedUrlCommand) {
        print("command.arguments : \(command.arguments)")

        guard let arg = command.arguments.first as? [String:Any] else { return }
        guard let bookID = arg["book_id"] as? String else { return }
        guard let teachingID = arg["teaching_id"] as? String else { return }
        if bookID.isEmpty || teachingID.isEmpty {
            print("bookID and teachingID can not be empty.")
            return
        }
        let json = BibleDataManager.shared.getBookTeaching(book_id: bookID, teaching_id: teachingID)
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: json)
        self.commandDelegate!.send(pluginResult,callbackId: command.callbackId)
    }
}
