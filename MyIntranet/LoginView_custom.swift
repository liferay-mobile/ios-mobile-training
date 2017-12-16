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
