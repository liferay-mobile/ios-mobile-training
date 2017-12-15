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

class GetUserInteractor: ServerConnectorInteractor {
    
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
}
