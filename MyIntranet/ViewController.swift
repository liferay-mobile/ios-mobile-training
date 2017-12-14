/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */

import UIKit
import LiferayScreens

class ViewController: UIViewController, LoginScreenletDelegate {

    @IBOutlet weak var screenlet: LoginScreenlet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        screenlet.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        SessionContext.loadStoredCredentials()
//        
//        if (SessionContext.isLoggedIn) {
//            _ = SessionContext.currentContext?.relogin { [weak self] _ in
//                self?.performSegue(withIdentifier: "main", sender: nil)
//            }
//        }
    }
    
    func screenlet(_ screenlet: BaseScreenlet,
            onLoginError error: NSError) {
        print(error)
    }
    
    func screenlet(_ screenlet: BaseScreenlet,
            onLoginResponseUserAttributes attributes: [String:AnyObject]) {
        print(attributes)
        
        performSegue(withIdentifier: "main", sender: nil)
    }
    
    func screenlet(_ screenlet: BaseScreenlet, onCredentialsSavedUserAttributes attributes: [String : AnyObject]) {
        print("credentials saved")
    }

}

