//
//  SafariWebExtensionHandler.swift
//  Customize Search Engine Extension
//
//  Created by Cizzuk on 2022/10/22.
//

import SafariServices
import os.log

let SFExtensionMessageKey = "message"

class SafariWebExtensionHandler: NSObject, NSExtensionRequestHandling {

    let userDefaults = UserDefaults(suiteName: "group.com.tsg0o0.cse")
    
    func beginRequest(with context: NSExtensionContext) {
        let body: Dictionary<String, String> = ["type": "native", "top": userDefaults!.string(forKey: "urltop") ?? "https://archive.org/search?query=", "suffix": userDefaults!.string(forKey: "urlsuffix") ?? "", "avoidRL": userDefaults!.string(forKey: "avoidRL") ?? "1"]
        do {
            let data = try JSONEncoder().encode(body)
            let json = String(data: data, encoding: .utf8) ?? ""
            let extensionItem = NSExtensionItem()
            extensionItem.userInfo = [ SFExtensionMessageKey: json ]
            context.completeRequest(returningItems: [extensionItem], completionHandler: nil)
        } catch {
            print("error")
        }
    }
    
}
