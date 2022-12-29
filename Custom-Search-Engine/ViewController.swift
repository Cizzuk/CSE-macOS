//
//  ViewController.swift
//  Custom-Search-Engine
//
//  Created by tsg0o0 on 2022/10/22.
//

import Cocoa

class ViewController: NSViewController, NSTextFieldDelegate{
    
    @IBOutlet weak var topText: NSTextField!
    @IBOutlet weak var suffixText: NSTextField!
    
    let userDefaults = UserDefaults(suiteName: "group.com.tsg0o0.Custom-Search-Engine")
    override func viewDidLoad() {
        super.viewDidLoad()
        topText.stringValue = userDefaults!.string(forKey: "urltop") ?? "twitter.com/search?q="
        suffixText.stringValue = userDefaults!.string(forKey: "urlsuffix") ?? "&f=live"
        topText.delegate = self
        suffixText.delegate = self
    }

    override func cursorUpdate(with event: NSEvent) {
        userDefaults!.set(topText.stringValue, forKey: "urltop")
        userDefaults!.set(suffixText.stringValue, forKey: "urlsuffix")
    }
    override func keyUp(with event: NSEvent) {
        userDefaults!.set(topText.stringValue, forKey: "urltop")
        userDefaults!.set(suffixText.stringValue, forKey: "urlsuffix")
    }

    @IBAction func editInputTop(_ sender: Any) {
        userDefaults!.set(topText.stringValue, forKey: "urltop")
    }
    @IBAction func editInputSuffix(_ sender: Any) {
        userDefaults!.set(suffixText.stringValue, forKey: "urlsuffix")
    }

}
