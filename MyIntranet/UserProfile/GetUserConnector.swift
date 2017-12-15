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

class GetUserConnector: ServerConnector {
    
    let userId: Int64
    var resultUser: User?
    
    init(userId: Int64) {
        self.userId = userId
        super.init()
    }
    
    override func validateData() -> ValidationError? {
        if (userId <= 0) {
            return ValidationError("userId must be greater than 0")
        }
        
        return nil
    }
    
    override func doRun(session: LRSession) {
        let userService = LRUserService_v7(session: session)
        
        do {
            let result = try userService?.getUserById(withUserId: userId)
            
            if let result = result as? [String: AnyObject] {
                resultUser = User(attributes: result)
                lastError = nil
            }
            else {
                lastError = NSError.errorWithCause(.invalidServerResponse,
                                                   message: "Could not add comment.")
                resultUser = nil
            }
        } catch let error as NSError? {
            lastError = error
            resultUser = nil
        }
    }
}
