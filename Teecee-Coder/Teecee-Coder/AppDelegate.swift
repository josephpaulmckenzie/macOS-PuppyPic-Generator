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
            withTitle: "Fetch Teece and Coder Pic",
            action: #selector(AppDelegate.fetchTeeceeNCoderPic),
            keyEquivalent: "")
        
        statusBarMenu.addItem(
            withTitle: "Quit",
            action: #selector(AppDelegate.ExitNow),
            keyEquivalent: "")
    }
    
    
    @objc func fetchTeeceePic() {
        // print("Fetching Random Teecee Pic")
        
        let url = URL(string: "https://vew5aom1hl.execute-api.us-east-1.amazonaws.com/dev/teecee-pic")
        if let usableUrl = url {
            let request = URLRequest(url: usableUrl)
            let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                if let data = data {
                    if let stringData = String(data: data, encoding: .utf8) {
//                        print(stringData.components(separatedBy: ",").randomElement()!)
                        let phototoget = stringData.components(separatedBy: ",").randomElement()
                        getPhotos(photoToOpen: phototoget!  )
                    }
                }
            })
            task.resume()
        }
        func getPhotos(photoToOpen: String) {
            
        let photoToOpen = photoToOpen.replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: "]", with: "").replacingOccurrences(of: "[", with: "")
        let url2 = URL(string: photoToOpen)
            print(url2)
        URLSession.shared.dataTask(with: url2!) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                 let data = data, error == nil
                else { return }
            DispatchQueue.main.async() { () -> Void in
                let fileManager = FileManager.default
                let myFilePathString = "///var/folders/hm/jrwkwy1j45l32j9zywph34zr0000gn/T/TemporaryItems/teecee.jpg"
                fileManager.createFile(atPath: myFilePathString, contents: data, attributes: nil)
                
                var username = NSUserName()
                // print(username)
                func openPhotos(photoToOpen: String) {
                    NSWorkspace.shared.open(URL(fileURLWithPath: photoToOpen ))
                }
                
                do {
                    openPhotos(photoToOpen: "///var/folders/hm/jrwkwy1j45l32j9zywph34zr0000gn/T/TemporaryItems/teecee.jpg")
                } catch {
                    print(error)
                }
                
            }}.resume()
    }
}

    @objc func fetchCoderPic() {
        // print("Fetching Random Teecee Pic")
        
        let url = URL(string: "https://vew5aom1hl.execute-api.us-east-1.amazonaws.com/dev/coder-pic")
        if let usableUrl = url {
            let request = URLRequest(url: usableUrl)
            let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                if let data = data {
                    if let stringData = String(data: data, encoding: .utf8) {
                        //                        print(stringData.components(separatedBy: ",").randomElement()!)
                        let phototoget = stringData.components(separatedBy: ",").randomElement()
                        getPhotos(photoToOpen: phototoget!  )
                    }
                }
            })
            task.resume()
        }
        func getPhotos(photoToOpen: String) {
            
            let photoToOpen = photoToOpen.replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: "]", with: "").replacingOccurrences(of: "[", with: "")
            let url2 = URL(string: photoToOpen)
            print(url2)
            URLSession.shared.dataTask(with: url2!) { (data, response, error) in
                guard
                    let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                    let data = data, error == nil
                    else { return }
                DispatchQueue.main.async() { () -> Void in
                    let fileManager = FileManager.default
                    let myFilePathString = "///var/folders/hm/jrwkwy1j45l32j9zywph34zr0000gn/T/TemporaryItems/coder.jpg"
                    fileManager.createFile(atPath: myFilePathString, contents: data, attributes: nil)
                    
                    var username = NSUserName()
                    // print(username)
                    func openPhotos(photoToOpen: String) {
                        NSWorkspace.shared.open(URL(fileURLWithPath: photoToOpen ))
                    }
                    
                    do {
                        openPhotos(photoToOpen: "///var/folders/hm/jrwkwy1j45l32j9zywph34zr0000gn/T/TemporaryItems/coder.jpg")
                    } catch {
                        print(error)
                    }
                    
                }}.resume()
        }
    }
    
    @objc func fetchTeeceeNCoderPic() {
        // print("Fetching Random Teecee Pic")
        
        let url = URL(string: "https://vew5aom1hl.execute-api.us-east-1.amazonaws.com/dev/teecee-coder-pic")
        if let usableUrl = url {
            let request = URLRequest(url: usableUrl)
            let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                if let data = data {
                    if let stringData = String(data: data, encoding: .utf8) {
                        //                        print(stringData.components(separatedBy: ",").randomElement()!)
                        let phototoget = stringData.components(separatedBy: ",").randomElement()
                        getPhotos(photoToOpen: phototoget!  )
                    }
                }
            })
            task.resume()
        }
        func getPhotos(photoToOpen: String) {
            
            let photoToOpen = photoToOpen.replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: "]", with: "").replacingOccurrences(of: "[", with: "")
            let url2 = URL(string: photoToOpen)
            print(url2)
            URLSession.shared.dataTask(with: url2!) { (data, response, error) in
                guard
                    let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                    let data = data, error == nil
                    else { return }
                DispatchQueue.main.async() { () -> Void in
                    let fileManager = FileManager.default
                    let myFilePathString = "///var/folders/hm/jrwkwy1j45l32j9zywph34zr0000gn/T/TemporaryItems/teecee-coder.jpg"
                    fileManager.createFile(atPath: myFilePathString, contents: data, attributes: nil)
                    
                    var username = NSUserName()
                    // print(username)
                    func openPhotos(photoToOpen: String) {
                        NSWorkspace.shared.open(URL(fileURLWithPath: photoToOpen ))
                    }
                    
                    do {
                        openPhotos(photoToOpen: "///var/folders/hm/jrwkwy1j45l32j9zywph34zr0000gn/T/TemporaryItems/teecee-coder.jpg")
                    } catch {
                        print(error)
                    }
                    
                }}.resume()
        }
    }

@IBAction func ExitNow(sender: AnyObject) {
    NSApplication.shared.terminate(self)
}
}

