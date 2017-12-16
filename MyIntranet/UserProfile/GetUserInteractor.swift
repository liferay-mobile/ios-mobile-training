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

class GetUserInteractor: ServerReadConnectorInteractor {
    
    let userId: Int64
    
    var resultUser: User?
    
    init(screenlet: BaseScreenlet, userId: Int64) {
        self.userId = userId
        super.init(screenlet: screenlet)
    }
    
    override func completedConnector(_ c: ServerConnector) {
        guard let c = c as? GetUserConnector else {
            return
        }
        
        resultUser = c.resultUser
    }
    
    override func createConnector() -> ServerConnector? {
        return GetUserConnector(userId: userId)
    }
    
    override func readFromCache(_ c: ServerConnector, result: @escaping (AnyObject?) -> Void) {
        guard let cacheManager = SessionContext.currentContext?.cacheManager,
            let c = c as? GetUserConnector else {
            result(nil)
            return
        }
        let key = "\(userId)"
        let collection = ScreenletName(type(of: screenlet!))
        
        cacheManager.getAny(collection: collection, key: key) { user in
            c.resultUser = user as? User
            
            result(user)
        }
    }
    
    override func writeToCache(_ c: ServerConnector) {
        guard let cacheManager = SessionContext.currentContext?.cacheManager,
            let c = c as? GetUserConnector else {
                return
        }
        let key = "\(userId)"
        let collection = ScreenletName(type(of: screenlet!))
        
        let user = c.resultUser
        
        cacheManager.setClean(collection: collection, key: key, value: user!, attributes: [:])
    }
    
    
}
