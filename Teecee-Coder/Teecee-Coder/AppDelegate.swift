//
//  AppDelegate.swift
//  Teecee-Coder
//
//  Created by Joseph Mckenzie on 5/22/19.
//  Copyright © 2019 Joseph Mckenzie. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    var statusBarItem: NSStatusItem!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        let statusBar = NSStatusBar.system
        statusBarItem = statusBar.statusItem(
            withLength: NSStatusItem.squareLength)
        statusBarItem.button?.title = " 🐶 "
        
        let statusBarMenu = NSMenu(title: "Fetch Teecee & Coder Pics")
        statusBarItem.menu = statusBarMenu
        
        statusBarMenu.addItem(
            withTitle: "Fetch Teecee Pic",
            action: #selector(AppDelegate.fetchTeeceePic),
            keyEquivalent: "")
        
        statusBarMenu.addItem(
            withTitle: "Fetch Coder Pic",
            action: #selector(AppDelegate.fetchCoderPic),
            keyEquivalent: "")
        
        statusBarMenu.addItem(
            withTitle: "Fetch Teece and Coder Together",
            action: #selector(AppDelegate.fetchTeeceeNCoderPic),
            keyEquivalent: "")
    }
    
    
    @objc func fetchTeeceePic() {
        print("Fetching Random Teecee Pic")
        
        func openPhotos(photoToOpen: String) {
            NSWorkspace.shared.open(URL(fileURLWithPath: photoToOpen ))
        }
        
        do {
            let files = try FileManager.default.contentsOfDirectory(atPath: "/Users/josephmckenzie/Pictures/Teecee/")
            let myItem = files.randomElement()
                    openPhotos(photoToOpen: "/Users/josephmckenzie/Pictures/Teecee/" +  myItem!)
            print(files)
        } catch {
            print(error)
        }
    }
    
    @objc func fetchCoderPic() {
        print("Fetching Random Coder Pic")
        
        func openPhotos(photoToOpen: String) {
            NSWorkspace.shared.open(URL(fileURLWithPath: photoToOpen ))
        }
        
        do {
            let files = try FileManager.default.contentsOfDirectory(atPath: "/Users/josephmckenzie/Pictures/Coder/")
            let myItem = files.randomElement()
            openPhotos(photoToOpen: "/Users/josephmckenzie/Pictures/Coder/" +  myItem!)
            print(files)
        } catch {
            print(error)
        }

    }
    
    @objc func fetchTeeceeNCoderPic() {
        print("Fetching Random Coder Pic")
        
        func openPhotos(photoToOpen: String) {
            NSWorkspace.shared.open(URL(fileURLWithPath: photoToOpen ))
        }
        
        do {
            let files = try FileManager.default.contentsOfDirectory(atPath: "/Users/josephmckenzie/Pictures/Teecee-Coder/")
            let myItem = files.randomElement()
            openPhotos(photoToOpen: "/Users/josephmckenzie/Pictures/Teecee-Coder/" +  myItem!)
            print(files)
        } catch {
            print(error)
        }
        
    }
}

