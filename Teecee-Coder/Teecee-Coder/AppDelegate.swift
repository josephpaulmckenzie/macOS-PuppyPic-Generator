//
//  AppDelegate.swift
//  Teecee-Coder
//
//  Created by Joseph Mckenzie on 5/22/19.
//  Copyright © 2019 Joseph Mckenzie. All rights reserved.
//

import Cocoa
import SwiftSocket
import Alamofire
import Foundation

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    var statusBarItem: NSStatusItem!
    var api_endpoint = ""
//    var pic_folder = ""
    var puppy = ""
    func applicationDidFinishLaunching(_ aNotification: Notification) {
      
//        if Reachability.isConnectedToNetwork(){
//            print("Internet Connection Available!")
//        }else{
//            print("Internet Connection not Available!")

//        }
        
        let statusBar = NSStatusBar.system
        statusBarItem = statusBar.statusItem(
            withLength: NSStatusItem.squareLength)
        statusBarItem.button?.title = " 🐶 "
        
        let statusBarMenu = NSMenu(title: "Fetch Teecee & Coder Pics")
        statusBarItem.menu = statusBarMenu
        
        statusBarMenu.addItem(
            withTitle: "Fetch Teecee Pic",
            action: #selector(AppDelegate.fetchPuppyPics),
            keyEquivalent: "")
        
        statusBarMenu.addItem(
            withTitle: "Fetch Coder Pic",
            action: #selector(AppDelegate.fetchPuppyPics),
            keyEquivalent: "")
        
        statusBarMenu.addItem(
            withTitle: "Fetch Teece and Coder Pic",
            action: #selector(AppDelegate.fetchPuppyPics),
            keyEquivalent: "")
        
        statusBarMenu.addItem(
            withTitle: "Quit",
            action: #selector(AppDelegate.ExitNow),
            keyEquivalent: "")
    }
    
    
    @objc func fetchPuppyPics(_ sender: NSMenuItem) {
        print( sender.title)
        let temporaryDirectoryURL = URL(fileURLWithPath: NSTemporaryDirectory(),
            isDirectory: true)
        if sender.title == "Fetch Teecee Pic" {
            print("Hello")
           api_endpoint = "teecee-pic"
           puppy = "Teecee"
            
        } else if sender.title == "Fetch Coder Pic" {
            api_endpoint = "coder-pic"
            puppy = "Coder"
            
        } else {
            api_endpoint = "teecee-coder-pic"
            puppy = "teecee-coder"
        }


        if Reachability.isConnectedToNetwork(){
            print("Internet Connection Available!")
            // Great we have internet now we can use our api to get the images from our s3 bucket
            let url = URL(string: "https://vew5aom1hl.execute-api.us-east-1.amazonaws.com/dev/\(api_endpoint)")
            if let usableUrl = url {
                let request = URLRequest(url: usableUrl)
                let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                    if let data = data {
                        if let stringData = String(data: data, encoding: .utf8) {
                            let phototoget = stringData.components(separatedBy: ",").randomElement()
                            getPhotos(photoToOpen: phototoget!, tempurl: temporaryDirectoryURL)
                        }
                    }
                })
                task.resume()
            }
        }else{
            print("Internet Connection not Available!")
            // Here is we want to pull from our Pictures folder so that we can still show images even if offline
            let username = NSUserName()
            // print(username)
            do {
                let files = try FileManager.default.contentsOfDirectory(atPath: "/Users/\(username)/Pictures/\(puppy)/")
                let myItem = files.randomElement()
                    openPhotos(photoToOpen: "/Users/\(username)/Pictures/\(puppy)/" +  myItem!)
                print(files)
            } catch {
                print(error)
            }
        }
        
        func getPhotos(photoToOpen: String,tempurl: URL) {
           let stringofurl = tempurl.absoluteString.replacingOccurrences(of: "file:", with: "")
            print(stringofurl)
        let photoToOpen = photoToOpen.replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: "]", with: "").replacingOccurrences(of: "[", with: "")
        let url2 = URL(string: photoToOpen)
        URLSession.shared.dataTask(with: url2!) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                 let data = data, error == nil
                else { return }
            DispatchQueue.main.async() { () -> Void in
                let fileManager = FileManager.default
                let myFilePathString = stringofurl + "\(self.puppy).jpg"
                fileManager.createFile(atPath: myFilePathString, contents: data, attributes: nil)
                self.openPhotos(photoToOpen: stringofurl + "\(self.puppy).jpg")
            }}.resume()
    }
}    
    func openPhotos(photoToOpen: String) {
        NSWorkspace.shared.open(URL(fileURLWithPath: photoToOpen ))
    }

    @IBAction func ExitNow(sender: AnyObject) {
        NSApplication.shared.terminate(self)
    }

}

