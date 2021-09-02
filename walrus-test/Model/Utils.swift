//
//  Utils.swift
//  walrus-test
//
//  Created by Chaitanya Deshpande on 31/08/21.
//
import Foundation
import UIKit

struct  Util {
    //Please Enter A New Api Key
    static let apiKey : String = "127a46f7373846c59ee34076661fa3a4"
    static let endPoint : String = "https://newsapi.org/v2/top-headlines?"
    static let storyBoard: UIStoryboard = {
        return UIStoryboard.init(name: "Main", bundle: nil)
    }()
    
}

extension UIImageView {
    func load(url: URL) {
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else {
                return
            }
            // maybe try dispatch to main
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }
        task.resume()
    }
}

extension UIColor {
    convenience init(hexaString: String, alpha: CGFloat = 1) {
        let chars = Array(hexaString.dropFirst())
        self.init(red:   .init(strtoul(String(chars[0...1]),nil,16))/255,
                  green: .init(strtoul(String(chars[2...3]),nil,16))/255,
                  blue:  .init(strtoul(String(chars[4...5]),nil,16))/255,
                  alpha: alpha)}
}
