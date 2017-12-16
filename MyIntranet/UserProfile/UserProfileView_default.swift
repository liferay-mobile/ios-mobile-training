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

class UserProfileView_default: BaseScreenletView, UserProfileViewModel {
    
    @IBOutlet weak var userPortrait: UserPortraitScreenlet!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    
    var fullName: String {
        get {
            return fullNameLabel.text ?? ""
        }
        set {
            fullNameLabel.text = newValue
        }
    }
    
    var userId: Int64 {
        get {
            return userPortrait.userId ?? 0
        }
        set {
            userPortrait.load(userId: newValue)
        }
    }
    
    var email: String {
        get {
            return emailLabel.text ?? ""
        }
        set {
            emailLabel.text = newValue
        }
    }
}
