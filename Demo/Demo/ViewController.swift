//
//  ViewController.swift
//  Demo
//
//  Created by tigerguo on 2022/3/30.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    let webview: WKWebView = {
        let config = WKWebViewConfiguration()
        config.dataDetectorTypes = [.phoneNumber]
        let webview = WKWebView(frame: .zero, configuration: config)
//        webview.configuration.dataDetectorTypes = [.phoneNumber]
        return webview
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(webview)
        webview.frame = view.bounds
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(callOpenUrl))
        loadHtml()
        self.title = "Launch Dial fail.  "
    }

    func loadHtml() {
        let url = Bundle.main.url(forResource: "index", withExtension: "html")!
        let string = try! String(contentsOf: url)
        webview.loadHTMLString(string, baseURL: nil)
    }

    @objc func callOpenUrl() {
        let phoneNumber1 = "tel:+1%20425-707-5929,,385011394%23"
            let url = URL(string: phoneNumber1)!
        //    let phoneNumber2: StaticString = "tel:+86%2013344542345"
        //    let url = URL(staticString: phoneNumber2)
            UIApplication.shared.open(url)
    }
}

