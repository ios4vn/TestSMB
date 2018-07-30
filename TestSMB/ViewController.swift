//
//  ViewController.swift
//  TestSMB
//
//  Created by Nguyen Hai Trieu on 7/30/18.
//  Copyright © 2018 Nguyen Hai Trieu. All rights reserved.
//

import UIKit
import SMBClient

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let host = "10.9.255.29"
        let fileServer = SMBFileServer.init(host: host, netbiosName: host, group: nil)
        fileServer?.connect(asUser: "Guest", password: "", completion: { (guest, error) in
            if error != nil {
                print("cannot")
            }
            else if guest {
                fileServer?.listShares({ (shares, errors) in
                    if let folders = shares {
                        for folder in folders {
                            print("folder \(folder.name)")
                        }
                    }
                })
            }
            else {
                print("login")
            }
            
        })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

