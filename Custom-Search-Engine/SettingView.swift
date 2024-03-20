//
//  SettingView.swift
//  Customize Search Engine
//
//  Created by Cizzuk Shihu on 2024/03/20.
//

import Foundation
import SwiftUI

@main

struct MainView: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    
    //Load app settings
    let userDefaults = UserDefaults(suiteName: "group.com.tsg0o0.cse")
    @State private var urltop = UserDefaults(suiteName: "group.com.tsg0o0.cse")!.string(forKey: "urltop") ?? "https://archive.org/search?query="
    @State private var urlsuffix = UserDefaults(suiteName: "group.com.tsg0o0.cse")!.string(forKey: "urlsuffix") ?? ""
    @State private var searchengine = UserDefaults(suiteName: "group.com.tsg0o0.cse")!.string(forKey: "searchengine") ?? "duckduckgo"
    @State private var avoidRL = UserDefaults(suiteName: "group.com.tsg0o0.cse")!.string(forKey: "avoidRL") ?? "1"
    
    var body: some View {
        List{
            // Top Section
            Section {
                TextField("", text: $urltop)
                    .disableAutocorrection(true)
                    .onChange(of: urltop) { entered in
                        userDefaults!.set(entered, forKey: "urltop")
                    }
                
            } header: {
                Text("TopUrl")
            } footer: {
                Text("TopUrl-Desc")
            }
            
            // Suffix Section
            Section {
                TextField("", text: $urlsuffix)
                    .disableAutocorrection(true)
                    .onChange(of: urlsuffix) { entered in
                        userDefaults!.set(entered, forKey: "urlsuffix")
                    }
            } header: {
                Text("SuffixUrl")
            } footer: {
                Text("SuffixUrl-Desc")
            }
            
            // Default SE Section
            Section {
                Picker("DefaultSE", selection: $searchengine) {
                    Text("DuckDuckGo").tag("duckduckgo")
                    Text("Sogou").tag("sogou")
                    Text("Yandex").tag("yandex")
                }
                .onChange(of: searchengine) { entered in
                    userDefaults!.set(entered, forKey: "searchengine")
                }
            } header: {
                Text("SafariSetting")
            } footer: {
                VStack (alignment : .leading) {
                    Text("DefaultSE-Desc")
                    Spacer()
                    Text("SafariSetting-Desc")
                }
            }
            
            // Support Section
            Section {
                // Contact Link
                Link(destination:URL(string: "https://cizzuk.net/contact/")!, label: {
                    HStack {
                        Image(systemName: "message")
                            .frame(width: 20.0)
                        Text("ContactLink")
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                })
                // Privacy Policy
                Link(destination:URL(string: "https://tsg0o0.com/privacy/")!, label: {
                    HStack {
                        Image(systemName: "hand.raised")
                            .frame(width: 20.0)
                        Text("PrivacyPolicyLink")
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                })
                // License Link
                Link(destination:URL(string: "https://www.mozilla.org/en-US/MPL/2.0/")!, label: {
                    HStack {
                        Image(systemName: "book.closed")
                            .frame(width: 20.0)
                        Text("LicenseLink")
                        Spacer()
                        Text("MPL 2.0")
                        Image(systemName: "chevron.right")
                    }
                })
                // GitHub Source Link
                Link(destination:URL(string: "https://github.com/tsg0o0/CSE-iOS")!, label: {
                    HStack {
                        Image(systemName: "ladybug")
                            .frame(width: 20.0)
                        Text("SourceLink")
                        Spacer()
                        Text("GitHub")
                        Image(systemName: "chevron.right")
                    }
                })
            } header: {
                Text("SupportLink")
            } footer: {
                HStack {
                    Text("© Cizzuk")
                    Spacer()
                    Text("Version: \(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String)")
                }
            }
        }
        .navigationTitle("CSESetting")
    }
}
