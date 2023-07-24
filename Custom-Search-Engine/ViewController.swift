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
    @IBOutlet weak var avoidRLSwitch: NSSwitch!
    var avoidRL = "1"
    
    let userDefaults = UserDefaults(suiteName: "group.com.tsg0o0.cse")
    override func viewDidLoad() {
        super.viewDidLoad()
        topText.stringValue = userDefaults!.string(forKey: "urltop") ?? "https://archive.org/search?query="
        suffixText.stringValue = userDefaults!.string(forKey: "urlsuffix") ?? ""
        avoidRL = userDefaults!.string(forKey: "avoidRL") ?? "1"
        if avoidRL == "0" {
            avoidRLSwitch.state = NSControl.StateValue.off
//            avoidRLSwitch.sendAction(for: .valueChanged)
        }else{
            avoidRLSwitch.state = NSControl.StateValue.on
//            avoidRLSwitch.sendActions(for: .valueChanged)
        }
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
    @IBAction func avoidRLChange(_ sender: Any) {
        if avoidRLSwitch.state == NSControl.StateValue.on {
            avoidRL = "1"
            userDefaults!.set(avoidRL, forKey: "avoidRL")
        }else{
            avoidRL = "0"
            userDefaults!.set(avoidRL, forKey: "avoidRL")
        }
    }
    
}
