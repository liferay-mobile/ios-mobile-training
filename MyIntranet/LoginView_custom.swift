//
//  LoginView_custom.swift
//  MyIntranet
//
//  Created by Victor Galan on 14/12/2017.
//  Copyright © 2017 Liferay. All rights reserved.
//

import Foundation
import LiferayScreens

class LoginView_custom: LoginView_default {
    
    @IBAction func valueChanged(_ sender: UISwitch) {
        (self.screenlet as? LoginScreenlet)?.saveCredentials = sender.isOn
    }
    
    override func createProgressPresenter() -> ProgressPresenter {
        return CustomProgressPresenter()
    }
}

class CustomProgressPresenter: DefaultProgressPresenter {
    
    override init() {
        super.init()
        
        self.customColor = UIColor(red: 216/255.0, green: 110/255.0, blue: 76/255.0, alpha: 0.87)
    }
}
