//
//  NetworkManager.swift
//  BibleDataFromDBDemo
//
//  Created by fahid on 18/04/2022.
//

import Foundation
import UIKit

let networkManager = NetworkManager.shared
class NetworkManager: NSObject {
    static let shared = NetworkManager()
    private override init() {
        super.init()
    }
    deinit {
      observation?.invalidate()
    }
    private var observation: NSKeyValueObservation?
    private var downloadTask: URLSessionDownloadTask!
    private var currentDownloadingFile: Verse!
    var successClosure: (()->Void)? = nil

    func stopActiveDownloadRequests() {
        if let task = downloadTask {
            task.cancel()
        }
    }

    func startDownloadingMedia(verse: Verse, successClosure: (()->Void)?) {
        let url = verse.remoteURLForContentType
        guard let remoteURL = URL(string: url) else {
            print("verse content url is not valid: \(url)")
            return
        }
        guard let localURL = verse.localURLForContentType else {
            print("verse localURL url is not valid")
            return
        }
        
        //  If Remote file is previously download then just link local path in Realm db
        if DocumentsManager.shared.fileExistAt(localURL) {
            print("File already downloaded at: \(localURL)")
            successClosure?()
            return
        }

        //  Remote file is not downloaded ever so download and save in local directory
        print("Downloading teaching_audio for file: \(remoteURL)")
        currentDownloadingFile = verse
        self.successClosure = successClosure
        downloadTask = URLSession.shared.downloadTask(with: remoteURL) { [weak self] (localURL, urlResponse, error) in
            guard let self = self else { return }
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                guard let file = self.currentDownloadingFile else { return }
                if let error = error {
                    print("Error downloading file from: \(String(describing: file.remoteURLForContentType))")
                    print(error)
                    return
                }
                if let localURL = localURL {
                    print("Downloading Complete for file")
                    print("Downloaded Temp file path: \(localURL)")
                    print("localURL.pathExtension: \(localURL.pathExtension)")
                    guard let file = self.currentDownloadingFile else { return }
                    do {
                        // after downloading your file you need to move it to your destination url
                        print("Remote URL: \(String(describing: file.remoteURLForContentType))")
                        guard let pathURL = file.localURLForContentType else { return }
                        if DocumentsManager.shared.fileExistAt(pathURL) {
                            _ = DocumentsManager.shared.deleteFileAt(pathURL)
                        }
                        print("New Local URL --> pathURL.path : \(pathURL.path)")
                        try FileManager.default.moveItem(at: localURL, to: pathURL)
                        file.printVersesDirectoryContent()
                        self.successClosure?()
                        print("File moved to documents folder")
                    } catch {
                        print(error)
                    }
                }
            }
        }
        
        observation = downloadTask.progress.observe(\.fractionCompleted) { progress, _ in
            let fractionCompleted = String(format: "%.2f", progress.fractionCompleted*100)
            print("Downlaoding progress: \(fractionCompleted)%")
        }
        
        downloadTask.resume()
    }
}



extension String {
    var containsHTTP: Bool {
        return self.contains("http")
    }
}
