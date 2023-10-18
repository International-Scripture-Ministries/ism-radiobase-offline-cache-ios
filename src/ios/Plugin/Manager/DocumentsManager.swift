//
//  DocumentsManager.swift
//  BibleDataFromDBDemo
//
//  Created by fahid on 18/04/2022.
//

import Foundation
import UIKit

class DocumentsManager: NSObject {

    static let shared = DocumentsManager()
    private override init(){}

    let versesFolderName = "Verses"
    let teachingAudiosFolderName = "TeachingAudios"
    let teachingsBadgeImagesFolderName = "TeachingsBadgeImages"

    fileprivate let fileManager = FileManager.default

    var documentsDirectory: URL {
        get {
            let directories = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
            let docDirectoryUrl = directories[0]
            return docDirectoryUrl
        }
    }

    var versesFolder: URL {
        get {
            let folderURL = documentsDirectory.appendingPathComponent(versesFolderName)
            return createDirctoryIfNotFound(atUrl: folderURL)
        }
    }

    var teachingAudiosFolder: URL {
        get {
            let folderURL = versesFolder.appendingPathComponent(teachingAudiosFolderName)
            return createDirctoryIfNotFound(atUrl: folderURL)
        }
    }

    var teachingsBadgeImagesFolder: URL {
        get {
            let folderURL = versesFolder.appendingPathComponent(teachingsBadgeImagesFolderName)
            return createDirctoryIfNotFound(atUrl: folderURL)
        }
    }

    //  MARK: Private Functions
    func createDirctoryIfNotFound(atUrl url: URL) -> URL {
        var isDir : ObjCBool = false
        if fileManager.fileExists(atPath: url.path, isDirectory:&isDir) {
            if isDir.boolValue {    // file exists and is a directory
                return url
            }
            else {      // file exists and is not a directory
                if deleteFileAt(url) {
                    return createDirectoryAt(url)
                }
                return url
            }
        }
        else {      // file does not exist
            return createDirectoryAt(url)
        }
    }

    private func createDirectoryAt( _ directoryUrl: URL) -> URL {
        do {
            try fileManager.createDirectory(atPath: directoryUrl.path, withIntermediateDirectories: false, attributes: nil)
        }
        catch let error as NSError {
            print(error.localizedDescription)
        }
        return directoryUrl
    }

    //  MARK: Public Functions

    func copyFile(at url: URL, to destination: URL) {
        do {
            try fileManager.copyItem(at: url, to: destination)
        } catch {
            print(error.localizedDescription)
        }
    }

    //MARK:  Clear Files
    
    func clearAllMediaFiles() {
        clearContent(of: versesFolder)
        clearContent(of: teachingAudiosFolder)
        clearContent(of: teachingsBadgeImagesFolder)
    }
    
    func clearContent(of folder: URL) {
        do {
            let filePaths = try fileManager.contentsOfDirectory(atPath: folder.path)
            for filePath in filePaths {
                let filePathUrl = folder.appendingPathComponent(filePath)
                _ = deleteFileAt(filePathUrl)
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    
    

    
    
    
                                                        //  Utility

    
    
    func fileExistAt( _ fileUrl: URL) -> Bool {
        
        return fileManager.fileExists(atPath: fileUrl.path)
    }
    
    @discardableResult
    func deleteFileAt( _ fileUrl: URL) -> Bool {
        
        do {
            try fileManager.removeItem(atPath: fileUrl.path)
        }
        catch let error as NSError {
            print(error.localizedDescription)
            return false
        }
        return true
    }
    
    func printDirectoryContent(url: URL) {
        do {
            let directoryContents = try fileManager.contentsOfDirectory(at: url, includingPropertiesForKeys: nil)
            print("Folder data")
            print("----------------------")
            print(directoryContents)
            print("----------------------")
        } catch {
            print(error)
        }
    }
}

