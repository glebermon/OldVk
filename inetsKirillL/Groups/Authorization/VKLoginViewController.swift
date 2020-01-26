//
//  VKLoginViewController.swift
//  inetsKirillL
//
//  Created by Глеб on 20/12/2018.
//  Copyright © 2018 Глеб. All rights reserved.
//

import UIKit
import WebKit
import Alamofire

class VKLoginViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView! {
        didSet {
            webView.navigationDelegate = self
        }
    }
    
    private var token: String = ""
    private var userID: String = ""
    private let networkService = NetworkServiceAlamofire()
    private let friendVKService = FriendVKService()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        deleteCookies()
        
        var urlComponents = URLComponents()
        
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "6791465"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.87"),
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        webView.load(request)

        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension VKLoginViewController: WKNavigationDelegate {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
            
            decisionHandler(.allow)
            return
        }
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce( [String: String] ())  { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]

                dict[key] = value
                return dict
        }
        
        guard let token = params["access_token"], let userID = Int(params["user_id"]!) else {
            decisionHandler(.cancel)
            return
        }
        print(token)
        Session.shared.token = token
        Session.shared.userID = userID
        print(token)
        
        decisionHandler(.cancel)
        
//        networkService.loadUserGroupsAlamofire()
//        networkService.loadUserFriendsAlamofire()
//        networkService.loadUserPhotosAlamofire()
//        networkService.loadSearchGroupsAlamofire()
//        friendVKService.loadFriendsAlamofire()
        
        performSegue(withIdentifier: "auth", sender: self)
    }
    
    func deleteCookies() {
        let dataStore = WKWebsiteDataStore.default()
        dataStore.fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { records in
            dataStore.removeData(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(), for: records) {
                print("Deleted: " + records.description)
                
            }
        }
    }
}
