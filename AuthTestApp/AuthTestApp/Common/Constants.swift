//
//  Constants.swift
//  AuthTestApp
//
//  Created by Эльдар Айдумов on 05.09.2025.
//

import Foundation

struct Secrets {
    static var googleAPIKey: String? {
        guard let path = Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist"),
              let xml = FileManager.default.contents(atPath: path),
              let plist = try? PropertyListSerialization.propertyList(
                from: xml,
                options: .mutableContainersAndLeaves,
                format: nil
              ),
              let dict = plist as? [String: Any] else {
            return nil
        }
        return dict["API_KEY"] as? String
    }
}
