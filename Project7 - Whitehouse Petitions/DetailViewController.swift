//
//  DetailViewController.swift
//  Project7 - Whitehouse Petitions
//
//  Created by Vitali Vyucheiski on 3/18/22.
//

import UIKit
import WebKit
import SwiftUI


class DetailViewController: UIViewController {
    var webView: WKWebView!
    var detailItem: Petition?
    var webStyle = "<style> body { font-size: 150%; color: #ffffff; background-color:#000000; } </style>"
    
    
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let detailItem = detailItem else { return }
        
        if self.traitCollection.userInterfaceStyle == .dark {
                    webStyle = "<style> body { font-size: 150%; color: #ffffff; background-color:#000000; } </style>"
                } else {
                    webStyle = "<style> body { font-size: 150%; </style>"
                }
        
        let html = """
                <html>
                <head>
                <meta name="viewport" content="width=device-width, initial-scale=1">
                \(webStyle)
                </head>
                <body>
                \(detailItem.body)
                </body>
                </html>

            """
        
        webView.loadHTMLString(html, baseURL: nil)
        
        
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if self.traitCollection.userInterfaceStyle == .dark {
                    webStyle = "<style> body { font-size: 150%; color: #ffffff; background-color:#000000; } </style>"
                } else {
                    webStyle = "<style> body { font-size: 150%; </style>"
                }
        viewDidLoad()
    }
    
}
