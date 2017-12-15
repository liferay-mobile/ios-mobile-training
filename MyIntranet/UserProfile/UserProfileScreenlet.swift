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


class UserProfileScreenlet : BaseScreenlet {
    
    @IBInspectable open var userId: Int64 = 0
    
    @IBInspectable open var autoLoad: Bool = true
    
    var viewModel: UserProfileViewModel! {
        return screenletView as! UserProfileViewModel
    }
    
    override func createInteractor(name: String, sender: AnyObject?) -> Interactor? {
        let interactor = GetUserInteractor(screenlet: self, userId: userId)
        
        interactor.onSuccess = {
            guard let user = interactor.resultUser else { return }
            
            self.viewModel.fullName = "\(user.firstName) \(user.lastName)"
            self.viewModel.email = user.email
            self.viewModel.userId = user.userId
        }
        
        interactor.onFailure = { error in
            print(error)
        }
        
        return interactor
    }
    
    override open func onShow() {
        if autoLoad {
            self.performAction(name: BaseScreenlet.DefaultAction)
        }
    }
    
}
