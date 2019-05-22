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
    }
    
    
    @objc func fetchTeeceePic() {
        print("Fetching Random Teecee Pic")
        
//        let paths = ["/Users/josephmckenzie/Downloads/IMG_20190514_131744.jpg"]
//        let fileURLs = paths.map{ NSURL(fileURLWithPath: $0)}
//        NSWorkspace.shared.activateFileViewerSelecting(fileURLs as [URL])
        // works for just opening photos app
        func openPhotos(photoToOpen: String) {
            NSWorkspace.shared.open(URL(fileURLWithPath: photoToOpen ))
        }

        openPhotos(photoToOpen: "/Users/josephmckenzie/Downloads/IMG_20190514_131744.jpg")
        
        let myArray = ["/Users/josephmckenzie/Downloads/IMG_20190514_131744.jpg"]
        let myItem = myArray.randomElement()
        print(myItem!)
            // Prints contents of  text file to terminal
//            if let url = URL(string: "https://www.w3.org/TR/PNG/iso_8859-1.txt") {
//                do {
//                    let contents = try String(contentsOf: url)
//                    print(contents)
//                    let contentarr = contents.components(separatedBy: ";")
//                    print(contentarr)
//                } catch {
//                    print("Some error happened")
//                }
//            } else {
//
//                print("Wrong URL")
//
//            }
//
//    }
    }
    
    @objc func fetchCoderPic() {
        print("Fetching Random Coder Pic")
    }
}

