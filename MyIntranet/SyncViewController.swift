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

class SyncViewController: UIViewController, SyncManagerDelegate {
    
    var syncManager: SyncManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let cacheManager =
            SessionContext.currentContext?.cacheManager else {
            return
        }
        
        syncManager = SyncManager(cacheManager: cacheManager)
        syncManager.delegate = self
    }
    
    @IBAction func syncButtonClick() {
        syncManager.startSync()
    }
    
    //MARK: SyncManagerDelegate
    
    func syncManager(_ manager: SyncManager, itemsCount: UInt) {
            print("Start sync...  \(itemsCount) items\n\n")
    }
    
    func syncManager(_ manager: SyncManager,
                     onItemSyncScreenlet screenlet: String,
                     startKey: String,
                     attributes: [String:AnyObject]) {
        print("[o] Start item. screenlet=\(screenlet) " +
            "key=\(startKey) attrs=\(attributes)\n\n")
    }
    
    func syncManager(_ manager: SyncManager,
                     onItemSyncScreenlet screenlet: String,
                     completedKey: String,
                     attributes: [String:AnyObject]) {
        print("[o] Item completed. screenlet=\(screenlet) " +
            "key=\(completedKey) attrs=\(attributes)\n\n")
    }
    
    func syncManager(_ manager: SyncManager,
                     onItemSyncScreenlet screenlet: String,
                     failedKey: String,
                     attributes: [String:AnyObject],
                     error: NSError) {
        print("[o] Item failed. screenlet=\(screenlet) " +
            "key=\(failedKey) attrs=\(attributes) error=\(error)\n\n")
    }
    
    func syncManager(_ manager: SyncManager,
                     onItemSyncScreenlet screenlet: String,
                     conflictedKey: String,
                     remoteValue: AnyObject,
                     localValue: AnyObject,
                     resolve: @escaping (SyncConflictResolution) -> ()) {
        
        print("[o] Item conflicted. screenlet=\(screenlet) " +
            "key=\(conflictedKey) remote=\(remoteValue) local=\(localValue)\nProcessing... ")
        
        let alert = UIAlertController(title: "Conflicted", message: "Choose resolve action",
                                      preferredStyle: .actionSheet)
        
        alert.addAction(
            UIAlertAction(title: "Use local", style: .default) { action in
                print("using local version\n\n")
                resolve(.useLocal)
        })
        alert.addAction(
            UIAlertAction(title: "Use remote", style: .default) { action in
                print("using remote version\n\n")
                resolve(.useRemote)
        })
        alert.addAction(
            UIAlertAction(title: "Discard", style: .destructive) { action in
                print("conflict discarded\n\n")
                resolve(.discard)
        })
        alert.addAction(
            UIAlertAction(title: "Ignore", style: .cancel) { action in
                print("conflict ignored\n\n")
                resolve(.ignore)
        })
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
