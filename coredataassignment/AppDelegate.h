//
//  AppDelegate.h
//  coredataassignment
//
//  Created by Hector Garcia on 2017-01-12.
//  Copyright © 2017 Hector Garcia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "ChoreMO.h"
#import "PersonMO.h"
#import "ChoreLogMO.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

- (ChoreMO *) createChoreMO;
- (PersonMO *) createPersonMO;
- (ChoreLogMO *) createChoreLogMO;


@end

